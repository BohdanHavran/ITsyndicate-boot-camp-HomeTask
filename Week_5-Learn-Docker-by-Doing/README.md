# Configuration Management Ansible

In this task, I used Terraform to deploy the infrastructure, build and deploy the Docker image, and Ansible to configure the database. Using Terraform I created an inventory and group_vars file, these files are used to connect Ansible to remote VM. After Terraform deploys the infrastructure, it runs Ansible, which already configures the database. If you don't have [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform), [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), or [Docker](https://docs.docker.com/engine/install/ubuntu/) installed, you need to install!

<h3>Note</h3>
Tested on:

- Ubuntu 20.04.3 LTS
- Terraform v1.3.6
- Ansible Version: 6.7.0

# How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask.git
```
```
cd ITsyndicate-boot-camp-HomeTask/Week_5-Learn-Docker-by-Doing
```
In order to run this project, you need to enter the following commands:
```
terraform init
```
```
terraform apply --auto-approve
```
If you need to remove a project:
```
terraform destroy --auto-approve
```
<b>Now you just have to wait for all the processes to complete</b>

# What you should know

Before starting the project, you should edit the variables.tf file, set the path to the ssh key there, if it is the same as in the template, then it does not need to be changed

After launching the project, Terrafrom will create everything needed:
### EC2
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/779f157c-23a8-47e0-8e21-16de08bc774e)

### ECS
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/29ea5eb6-aaa8-4c06-bc9c-6ac7cec155ee)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/6e21a637-07ab-4f8e-99db-c035a25d4294)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/4a1dbb6a-39a1-40de-8059-7abcf7ac8c79)

### ECR
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/4000cf57-d31e-41e2-9409-cd55cad9f997)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/1e78fd1e-a65e-4ee4-a349-b9ab8bfee53d)

### Dockerfile
```
FROM python:3

WORKDIR /app

COPY sample-django/requirements.txt /app/

RUN pip install -r requirements.txt

COPY sample-django/. /app/

RUN chmod +x script.sh

EXPOSE 8000

CMD ["sh", "-c", "/app/script.sh"]
```
# Result
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/40affcb6-5223-4f16-85c6-05ac31239d94)

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/00886324-b1ab-4935-be9f-1fe5a06ab190)

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/1ac01809-025a-45e3-a6a0-4736ce764dbf)

