# AWS services and how they work

<h3>Roadmap:</h3>

- [Task 1](#task1) 
- [Task 2](#task2) 
- [Task 3](#task3) 
- [Task 4](#task4)

### <a name="task1">Task 1</a>
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/a65f99bd-68cd-454f-aa96-4c2155918235)

### <a name="task2">Task 2</a>

### I - Propose three ways to deploy the client's project on AWS, excluding direct deployment on EC2. Detail the pros and cons of each of the methods you propose. 
Method 1: AWS Elastic Beanstalk

- Easy Deployment: Elastic Beanstalk abstracts the underlying infrastructure, making it easy to deploy Django applications without managing the infrastructure details.
- Scalability: It automatically handles load balancing and scaling based on traffic.
- Managed Environment: AWS manages the environment, including updates, patches, and server configurations.
- Integrated Services: Seamless integration with Amazon RDS for PostgreSQL for database management.
- Built-in Monitoring: AWS provides monitoring and logging capabilities.

Method 2: AWS Fargate with Amazon RDS

- Containerized Deployment: Docker containers can be used to package both the Django application and PostgreSQL database.
- Scalability: Fargate automatically scales containers based on demand.
- Isolation: Each container has its own resources and is isolated from others.
- Database Management: Amazon RDS offers managed PostgreSQL, simplifying database operations.
- Flexible Resource Allocation: Fine-tune resource allocation for both app and database containers.

Method 3: AWS App Runner

- Simplicity: App Runner simplifies the deployment process, automatically building and deploying from source code or a container image.
- Scalability: Handles scaling and load balancing based on traffic.
- Integration: Easily integrates with Amazon RDS for PostgreSQL.
- Automated Updates: App Runner can automatically update the application when changes are pushed to the repository.
- Managed Service: AWS manages most of the underlying infrastructure, reducing operational overhead.

### II - Draw a schematic of the method you believe would be most efficient for the client using draw.io or any other diagramming tool. 

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/f7bbcb74-7b9c-4d11-83cd-097f55483315)

### III - Research serverless solutions on AWS and propose any options that could be beneficial for the client. Provide a thorough explanation as to why you think these solutions are suitable. 

Serverless solutions can offer benefits like automatic scaling, reduced operational overhead, and cost efficiency. For the client's project:

AWS Lambda with Amazon RDS Proxy

- AWS Lambda can be used to deploy the Django application in a serverless manner. AWS Lambda functions can handle HTTP requests via API Gateway. Amazon RDS Proxy acts as an intermediary between the Lambda function and the RDS database, providing efficient connection pooling.

AWS Aurora Serverless

- Aurora Serverless is a fully managed, auto-scaling relational database engine. It's compatible with PostgreSQL. The Django application can connect to Aurora Serverless for database operations.

AWS API Gateway and AWS App Runner

- Use AWS API Gateway to manage HTTP requests and route them to AWS Lambda functions running the Django app. Combine this with AWS App Runner to host the Django app container.

### <a name="task3">Task 3</a>

My goal is to gain a deep understanding of the various AWS services and best practices for designing and implementing scalable, secure, and highly available cloud solutions. To achieve this, I will complete the relevant AWS certification, ensuring a solid foundation and gradual growth of my knowledge and skills.

### <a name="task4">Task 4</a>
Hi, In this task I used Terraform to deploy the infrastructure

URL: 
- http://3.19.27.112/
- http://18.217.52.74/
- http://3.144.136.55/
  
# How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask.git
```
```
cd ITsyndicate-boot-camp-HomeTask/Week_1-AWS-services-and-how-they-work
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

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/996dda3c-a960-41ce-ac1d-75792dbb4e6d)

### VPC
Here you can view all information about the VPC

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/c0d934c3-0935-4309-aa14-70a785c1b9e7)

### Subnet
Here you can view all information about the Subnet

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/4edea885-e1b9-4606-ba2b-6a75dab80609)

### Peering connections
Here you can view all information about the Peering connections

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/7cdfac69-f29a-4b31-998f-62cfde1c0fde)

### Security Groups
Here you can view all information about the Security Groups

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/08d1e63e-683a-4194-8adb-28e8621086c9)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/799c9416-72de-40b7-8a52-db3e07c6ca59)

### Result
The result of the work done

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/832ead0c-8f52-44c8-9604-85d15fc88cd6)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/60364016-c279-4726-b0fc-0d6343f0184c)

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/a06cd771-19a7-4da2-91fa-f45291a8cdbc)


