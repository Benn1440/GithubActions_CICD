resource "aws_instance" "GithubActionsCICD" {
  ami           = "0c38b837cd80f13bb"
  instance_type = "t2.medium"
  key_name = "~/.ssh/devopskey"


   connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/devopskey") 
      host        = self.public_ip
    }

    provisioner "remote-exec" {
     inline = [
      # "sudo yum update -y",
      # "sudo yum install -y docker",
      # "sudo service docker start",
      # "sudo usermod -aG docker ubuntu",
      # "curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm",
      # "sudo rpm -Uvh minikube-latest.x86_64.rpm",
      # "minikube start --driver=none"

          "sudo apt update -y",
          "sudo apt install apt-transport-https ca-certificates curl software-properties-common -y",
          "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
          "echo deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
          "sudo apt update -y",
          "sudo apt install docker-ce docker-ce-cli containerd.io -y",
          "sudo usermod -aG docker $USER",
          "newgrp docker",
          "curl -LO https://dl.k8s.ioy/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl",
          "sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl",
          "curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64",
          "sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64",
          "minikube start"
        ]
    }

  tags = {
    Name = "Github-Actions Instance"
  }
}