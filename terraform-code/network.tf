# create an IG
resource "aws_internet_gateway" "eng110-nikhil-ig-terraform" {
    vpc_id = "${aws_vpc.eng110_nikhil_vpc_terraform.id}"
    tags = {
        Name = "eng110-nikhil-ig-terraform"
    }
}

# creating custom route table
resource "aws_route_table" "eng110-nikhil-rt-terraform" {
    vpc_id = "${aws_vpc.eng110_nikhil_vpc_terraform.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"         //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.eng110-nikhil-ig-terraform.id}" 
    }
    
    tags = {
        Name = "eng110-nikhil-rt-terraform"
    }
}

# associating route table to subnet
resource "aws_route_table_association" "eng110-nikhil-associate-public-rt"{
    subnet_id = "${aws_subnet.subnet_nikhil_1.id}"
    route_table_id = "${aws_route_table.eng110-nikhil-rt-terraform.id}"
}

