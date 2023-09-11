# High Availability, Scalability, and Core DevOps Practices

Hi, In this task I used Terraform to deploy the infrastructure

<h3>Roadmap:</h3>

- [Deploy and Scale an Application using Docker and AWS](#task1) 
- [Speed up the application with a CDN](#task2) 

# <a name="task1">Task: Deploy and Scale an Application using Docker and AWS</a>

### How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask.git
```
```
cd ITsyndicate-boot-camp-HomeTask/Week_2-High-Availability-Scalability-and-Core-DevOps-Practices
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
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/763fa912-8a4b-40ec-9670-b8b583d541a3)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/754c5984-da20-4c89-ab30-db8c0bccc04b)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/f98b7e58-f13a-42fd-8fc4-3bf15f052eef)

### Result
The result of the work done

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/baf2c9f5-9198-43f8-8291-08868f0e85d8)

### EC2 Auto-Scaling Group vs ECS Fargate

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

# <a name="task2">Task: Speed up the application with a CDN</a>
### Create AWS CloudFront

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/beb20834-fd2c-4dd6-9bf8-2c25dd299c46)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/3e0bea92-e57e-4c97-9695-2daac242c7ae)

### Connect AWS CloudFront before the load balancer

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/ae00ba69-07bf-4482-8441-4d32552b465e)

### Behavior 

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/d40f9c4d-8053-4c5d-ba32-dae17a623b41)

### Load testing 

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/9b2bb8d2-005f-444b-867d-cfda80fd267a)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/9526eade-3d86-4f72-948a-161483f51f79)

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/33956ac5-d82b-401d-8fda-d53b18d2fc9d)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/46872fd4-640c-4b7e-bb96-23f379715fd2)

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/66ca9679-89ab-4ba3-96a7-fbfa6880fccb)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/94e03070-bb25-4309-8578-c1470c1e26c7)




