
# 가상 프라이빗 게이트웨이 생성
resource "aws_vpn_gateway" "prd_vpn_gateway" {
  vpc_id = aws_vpc.PRD-VPC.id

  tags = {
    Name = "prd_vpn_gateway"
  }
}

data "aws_instance" "ON-PREMISE-PUB-OPENSWAN-1A" {
  provider    = aws.us-east-1 # 퍼블릭 IP를 가져올 인스턴스가 있는 리전
  instance_id = "i-0f0247dc055159095"
}

output "public_ip" {
  value = data.aws_instance.ON-PREMISE-PUB-OPENSWAN-1A.public_ip
}

# 고객 게이트웨이 생성
resource "aws_customer_gateway" "prd_customer_gateway" {
  bgp_asn    = 65000
  ip_address = data.aws_instance.ON-PREMISE-PUB-OPENSWAN-1A.public_ip # 고객측 공인 IP 입력
  type       = "ipsec.1"

  tags = {
    Name = "prd_customer_gateway"
  }
}

# VPN 연결 생성
resource "aws_vpn_connection" "seoulus_vpn_connection" {
  vpn_gateway_id      = aws_vpn_gateway.prd_vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.prd_customer_gateway.id
  type                = "ipsec.1"

  static_routes_only = true

  tags = {
    Name = "seoulus_vpn_connection"
  }
}

# VPN 연결의 라우팅 설정
resource "aws_vpn_connection_route" "seoulus_vpn_route" {
  vpn_connection_id      = aws_vpn_connection.seoulus_vpn_connection.id
  destination_cidr_block = "10.240.0.0/16" # 버지니아 VPC의 CIDR
}

