# Set up a CI/CD pipeline with GitHub Actions to deploy a code, from GitHub to a Minikube cluster running on an EC2 instance deployed using Terraform.

App Running Locally.<br><br>
![image](https://github.com/user-attachments/assets/1218c520-d252-4305-a1bd-de793dff3b31)

# Create VPC with AWS Terraform Module
To implement this Infrastructure, I used AWS VPC module<br><br>
https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

![image](https://github.com/user-attachments/assets/591e2672-36c4-4e34-b061-d08e967bfcc9)

![image](https://github.com/user-attachments/assets/642e34e4-9076-44e5-9ccc-ddf0fd73d140)


# Errors Experienced 

Series of Failures on Pipeline, due to secret keys, and indentation errors. 
![image](https://github.com/user-attachments/assets/2a4a4c61-2ae0-47eb-854b-73ec7b970e89)
