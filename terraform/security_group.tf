resource "yandex_vpc_security_group" "gitlab_sg" {
  name        = var.sg_name
  description = var.sg_name
  network_id  = var.network_id


  egress {
    protocol       = "ANY"
    port           = "-1"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    port           = 53
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol       = "TCP"
    port           = 9100
    v4_cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    protocol       = "ANY"
    port           = 2376
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

}
