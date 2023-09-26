# Configuration Management Ansible

In this task, I used Terraform to deploy the infrastructure and Ansible to configure it. Using Terraform, I created an inventory file and group_vars, these files are used to connect Ansible to remote virtual machines. After Terraform deploys the infrastructure, it runs Ansible, which already configures the servers. If you don't have [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform) or [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed

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
cd ITsyndicate-boot-camp-HomeTask/Week_4-Configuration-Management-with-Ansible
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

After launching the project, Terrafrom will create everything needed to run Ansible:

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/8c0c1d9c-b911-4a8b-968e-aa6350c4a42f)<br>
Inventory file:

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/c8d538d6-8887-4906-9d2b-4ad8eb8b6ff0)<br>
Vars:

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/bbd1c094-de9d-4ccc-b147-8113f9da97ca)

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/05e0e15a-7ce5-495d-be92-9e05d71cbf98)<br>
Group vars:

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/65a6b4ba-4b05-4981-b4d4-29ea83d923e1)


# Result
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/72ce35c9-37ca-41c9-a8cd-27667d2a11fa)

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/aa0b3027-4a2b-46ec-892a-e45468035c40)

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/0feedac0-2fc9-41ae-8824-24f003db1ef7)
