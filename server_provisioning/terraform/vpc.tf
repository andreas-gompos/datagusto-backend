resource "aws_vpc" "serving_ai_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "serving_ai_vpc"
    }
}

resource "aws_subnet" "serving_ai_server_subnet" {
    vpc_id = "${aws_vpc.serving_ai_vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"

    tags {
        Name = "serving_ai_server_subnet"
    }
}

resource "aws_internet_gateway" "serving_ai_gw" {
    vpc_id = "${aws_vpc.serving_ai_vpc.id}"

    tags {
        Name = "serving_ai_gw"
    }
}

resource "aws_route_table" "serving_ai_route_table_public" {
    vpc_id = "${aws_vpc.serving_ai_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.serving_ai_gw.id}"
    }

    tags {
        Name = "serving_ai_route_table_public"
    }
}

resource "aws_route_table_association" "serving_ai_route_table_association_public" {
    subnet_id = "${aws_subnet.serving_ai_server_subnet.id}"
    route_table_id = "${aws_route_table.serving_ai_route_table_public.id}"
}