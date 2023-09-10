# High Availability, Scalability, and Core DevOps Practices

Hi, In this task I used Terraform to deploy the infrastructure
  
# How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask.git
```
```
cd ITsyndicate-boot-camp-HomeTask/Week_2-High-Availability,Scalability,and-Core-DevOps-Practices
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
### EC2
Here you can view all information about the instance

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/7553c8cc-cd94-4611-a370-c1287db2cda9)

### Load balancers
Here you can view all information about the Load balancers

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/53472063-8629-40d5-88d3-de648a7e0463)

### Auto Scaling groups
Here you can view all information about the Auto Scaling groups

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/ffa75ed4-90dc-4d4b-88de-5f0bd3300b08)

### CloudWatch
Here you can view all information about the CloudWatch

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/7ca2bc2c-5f1e-4903-a789-d67abf18594a)

### Result
The result of the work done

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/15a9db6b-d3a0-4e6e-b79c-0e1c06822b84)

# EC2 Auto-Scaling Group vs ECS Fargate

EC2 Auto-Scaling Group

Pros:
- Control and Customization: EC2 Auto-Scaling Groups provide more control over the underlying infrastructure. You can choose instance types, customize security settings, and use your own Amazon Machine Images (AMIs).
- Cost Efficiency: For long-running applications with consistent workloads, EC2 instances can be more cost-effective than Fargate as they offer a lower per-hour cost.
- Scalability Flexibility: EC2 Auto-Scaling Groups can be configured for fine-grained control over scaling policies, including custom metrics and cooldown periods, allowing you to tailor the scaling behavior to your specific needs.
- Legacy Application Support: If you have legacy applications that require special configurations or dependencies, EC2 instances can accommodate these needs more easily.
  
Cons:
- Complex Setup: Setting up and maintaining EC2 instances, including managing the underlying infrastructure, can be more complex and time-consuming compared to Fargate.
- Resource Management: You need to manage resource allocation, including instance provisioning and scaling policies, which can be challenging and may require more operational overhead.
- Higher Operational Burden: EC2 instances require regular maintenance, such as patching, updates, and handling failures, which increases the operational burden.
- Limited Isolation: EC2 instances share physical resources with other workloads, potentially leading to noisy neighbors or security concerns if not properly configured.

ECS Fargate

Pros:
- Simplified Deployment: ECS Fargate abstracts away the underlying infrastructure, making it easier to deploy containers without worrying about managing EC2 instances.
- Reduced Operational Overhead: Fargate handles tasks like scaling, patching, and managing the underlying infrastructure, reducing the operational burden on your team.
- Improved Isolation: Fargate provides better isolation between tasks, ensuring that your containers don't contend for resources with other workloads.
- Pay-as-You-Go Pricing: Fargate offers a pay-as-you-go pricing model, where you only pay for the resources your containers use, making it cost-effective for variable workloads.

Cons:
- Limited Customization: Fargate abstracts infrastructure details, limiting the customization options available for EC2 instances. Some advanced configurations may not be possible.
- Higher Cost for Consistent Workloads: Fargate can be more expensive than EC2 instances for applications with consistent workloads, as you pay a premium for the managed service.
- Learning Curve: While Fargate simplifies deployment, it may require some time for teams to adapt to the managed service paradigm.
