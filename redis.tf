#ElasticCache 원본 클러스터
resource "aws_elasticache_cluster" "PRD-REDIS" {
  cluster_id           = "prd-redis"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  engine_version       = "7.1"
  port                 = 6379
  security_group_ids   = [aws_security_group.PRD-SG-REDIS.id]
  subnet_group_name    = aws_elasticache_subnet_group.PRD-REDIS-SUBG.name # 서브넷 그룹 추가
}

# ELASTICACHE SUBNETGROUP
resource "aws_elasticache_subnet_group" "PRD-REDIS-SUBG" {
  name       = "PRD-REDIS-SUBG"
  subnet_ids = [aws_subnet.PRD-PRI-01-2A.id, aws_subnet.PRD-PRI-01-2C.id] # 새 redis 서브넷 ID 사용
}

#ElasticCache 복제 그룹
resource "aws_elasticache_replication_group" "PRD-REDIS-REPLICA" {
  automatic_failover_enabled  = true # 자동 장애 조치(failover) 활성화
  preferred_cache_cluster_azs = ["ap-northeast-2a", "ap-northeast-2c"]
  replication_group_id        = "PRD-REDIS-REPLICA"     # 복제 그룹 ID
  description                 = "prd-redis-replication" # 복제 그룹 설명
  node_type                   = "cache.t2.micro"        # 노드 유형
  num_cache_clusters          = 2                       # 2개의 캐시 클러스터 생성
  parameter_group_name        = "default.redis7"        # Redis 7에 맞는 기본 파라미터 그룹 사용
  port                        = 6379
  subnet_group_name           = aws_elasticache_subnet_group.PRD-REDIS-SUBG.name # 서브넷 그룹 참조

  lifecycle {
    ignore_changes = [num_cache_clusters] # 캐시 클러스터 수 변경 시 Terraform이 무시하도록 설정
  }
}

#ElasticCache 복제본 클러스터
resource "aws_elasticache_cluster" "redis-replica" {
  count = 1

  cluster_id           = "prd-redis-replica-${count.index}"
  replication_group_id = aws_elasticache_replication_group.PRD-REDIS-REPLICA.id
}
