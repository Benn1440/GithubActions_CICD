resource "aws_instance" "GithubActionsCICD" {
  ami           = "0c38b837cd80f13bb"
  instance_type = "t2.micro"
  key_name = "~/.ssh/devopskey"


   connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/devopskey") 
      host        = self.public_ip
    }

    provisioner "remote-exec" {
     inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo service docker start",
      "sudo usermod -aG docker ubuntu",
      "curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm",
      "sudo rpm -Uvh minikube-latest.x86_64.rpm",
      "minikube start --driver=none"
    ]
    }

  tags = {
    Name = "Github-Actions Instance"
  }
}