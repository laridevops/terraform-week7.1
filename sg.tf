# Create a security group
resource "aws_security_group" "my_sg" {
  name        = "splunk-sg"
  description = "Allows SSH, HTTPD and SPLUNK"
  vpc_id = aws_vpc.vpc1.id

  # Define inbound rules (ingress rules)
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

ingress {
    description = "SPLUNK"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SPLUNK from anywhere
  }
}