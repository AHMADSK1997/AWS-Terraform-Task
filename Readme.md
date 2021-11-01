# AWS Terraform Task


### Requierments :
We'll create a Terraform code that produces the following AWS resources:
(In the default VPC)
- 2 Instances (t2.micro) - with NGINX running on each
- An Application Load Balancer that forwards the users traffic to the servers

<img width="700" alt="screenshot" src="images\Screenshot 2021-11-01 182343.jpg">

_______________________________________________

## Terraform code:

### Before starting : 

- #### You need to donwload Terraform on your computer: 
 
  follow the instructions in link: https://www.terraform.io/downloads.html 
  Install Terraform by unzipping it and moving it to a directory and include it in your system's PATH .
  
- #### Create an AWS access key:

  - Create an IAM user, and then define that user's permissions as narrowly as possible.
  - Create the access key under that IAM user.

- #### Installing the AWS CLI version 2:
    follow the instructions in link: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

_______________________________________________

### Run Terraform code:

- #### Initialize terraform : open the terminal and run the following command

   ```
    terraform init
   ```
- #### Before applying , preview code results:

   run the following command

   ```
    terraform plan
   ```
  The terraform plan command creates an execution plan with a preview of the changes that Terraform will make to your infrastructure.
  
- #### run the code by the command:
  
   ```
    terraform apply
   ```
 
 - #### Go to AWS LoadBalancer & you'll see the created ALB , copy DNS address and paste it on browser , this is what you'll see :
 
   <img width="700" alt="screenshot" src="images\Screenshot 2021-11-01 184035.jpg">

   
  
  