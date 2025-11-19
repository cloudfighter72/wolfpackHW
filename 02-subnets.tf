##################  public subnets  #####################

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.demo-vpc.id
  cidr_block              = "10.69.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-us-east-2a"
  }
}


resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.demo-vpc.id
  cidr_block              = "10.69.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-us-east-2b"
  }
}


resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.demo-vpc.id
  cidr_block              = "10.69.3.0/24"
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-us-east-2c"
  }
}


##################  private subnets  #####################


resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = "10.69.11.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "private-subnet-us-east-2a"
  }
}


resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = "10.69.12.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "private-subnet-us-east-2b"
  }
}


resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = "10.69.13.0/24"
  availability_zone = "us-east-2c"

  tags = {
    Name = "private-subnet-us-east-2c"
  }
}