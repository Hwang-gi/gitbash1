resource "aws_iam_role" "dms-vpc-role" {
  name        = "dms-vpc-role"
  description = "Allows DMS to manage VPC"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "dms.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dms-vpc-role-attachment" {
  role       = aws_iam_role.dms-vpc-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSVPCManagementRole"
}

# DMS 서브넷 그룹 생성
resource "aws_dms_replication_subnet_group" "dms_subnet_group" {
  replication_subnet_group_description = "dms-subnet-group"
  subnet_ids = [
    aws_subnet.PRD-PRI-02-2A.id, # 실제 서브넷 ID 참조
    aws_subnet.PRD-PRI-02-2C.id,
  ]
  replication_subnet_group_id = "dms-subnetgroup-id"
}

# DMS 엔드포인트 생성 (RDS 소스 엔드포인트)
resource "aws_dms_endpoint" "prd-rds-master-source" {
  endpoint_id   = "prd-rds-master-source"
  endpoint_type = "source"
  engine_name   = "mariadb"                                                                                # 데이터베이스 엔진
  username      = "boss"                                                                                   # RDS 사용자 이름
  password      = "sd12!fg34"                                                                              # RDS 비밀번호
  database_name = "prd_mariadb"                                                                            # 데이터베이스 이름
  server_name   = "prd-rds-master2024092502595040330000000d.crgoyc04k2rj.ap-northeast-2.rds.amazonaws.com" # RDS 인스턴스의 DNS 이름
  port          = 3306                                                                                     # RDS의 포트
  ssl_mode      = "none"

  tags = {
    Name = "RDS Source Endpoint"
  }
}

# target endpoint 생성
resource "aws_dms_endpoint" "mariadb_target" {
  endpoint_id   = "mariadb-target"
  endpoint_type = "target"
  engine_name   = "mariadb"
  username      = "boss"
  password      = "sd12!fg34"
  database_name = "prd_mariadb"
  server_name   = "10.240.2.201"
  port          = 3306
  ssl_mode      = "none"

  tags = {
    Name = "MariaDB Target Endpoint"
  }
}
resource "aws_dms_replication_instance" "prd-dms-replication-instance" {
  replication_instance_id     = "dms-replication-instance"
  replication_instance_class  = "dms.t3.medium" # 인스턴스 클래스 선택
  allocated_storage           = 50              # 스토리지 크기 (GB)
  replication_subnet_group_id = aws_dms_replication_subnet_group.dms_subnet_group.id
  vpc_security_group_ids      = [aws_security_group.PRD-SG-RDS.id]
  multi_az                    = true
  publicly_accessible         = true
  tags = {
    Name = "prd-dms-replication-instance"
  }
}

resource "aws_dms_replication_task" "prd_dms_replication_task" {
  replication_task_id      = "prd-dms-replication-task-tf"
  migration_type           = "full-load"
  source_endpoint_arn      = aws_dms_endpoint.prd-rds-master-source.endpoint_arn
  target_endpoint_arn      = aws_dms_endpoint.mariadb_target.endpoint_arn
  replication_instance_arn = aws_dms_replication_instance.prd-dms-replication-instance.replication_instance_arn

  table_mappings = <<EOF
{
  "rules": [
    {
      "rule-type": "selection",
      "rule-id": "1",
      "rule-name": "include_all",
      "object-locator": {
        "schema-name": "%",
        "table-name": "%"
      },
      "rule-action": "include"
    }
  ]
}
EOF

  replication_task_settings = <<EOF
{
  "TargetTablePrepMode": "DO_NOTHING", 
  "BatchApplyEnabled": true,
  "BatchSize": 1000,
  "ChangeDataCaptureSettings": {
    "IncludeTransactionDetails": true,  
    "CommitInterval": 1000 
  }
}
EOF
}
