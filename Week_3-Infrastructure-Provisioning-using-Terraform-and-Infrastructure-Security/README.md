# Infrastructure Provisioning and Security

Hi, in this task, terraform was used to create a module that later interacts with terragrunt

# How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask.git
```
```
cd ITsyndicate-boot-camp-HomeTask/Week_3-Infrastructure-Provisioning-using-Terraform-and-Infrastructure-Security/terragrunt/(choose a development environment)/web_service
```
In order to run this project, you need to enter the following commands:
```
terragrunt init
```
```
terragrunt apply --auto-approve
```
If you need to remove a project:
```
terragrunt destroy --auto-approve
```
### File structure

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/b33c281d-cdfd-42fe-b243-843de5120e23)

If you need to change any configuration, you need to open the [terragrunt.hcl](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/blob/main/Week_3-Infrastructure-Provisioning-using-Terraform-and-Infrastructure-Security/terragrunt/production/web_service/terragrunt.hcl) file in any development environment

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/2cf44c2a-7117-4e65-b527-1ed144bb02e5)

In order to enter the provider, you need the [common.tfvars](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/blob/main/Week_3-Infrastructure-Provisioning-using-Terraform-and-Infrastructure-Security/terragrunt/production/common.tfvars) file in any development environment

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/ec8a70c2-f64d-4cc8-9de8-8c1400c93a68)


### EC2
Here you can view all information about the instance

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/7553c8cc-cd94-4611-a370-c1287db2cda9)

### Security Groups
Here you can view all information about the Security Groups. These photos show that the Security Groups are configured in such a way that no one can get information about the instances on port 80 except for the load balancer, and port 22 is configured according to a similar principle, just write down your IP address so that only you have access

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/b1b7bf4b-ca10-4176-9037-e92e7fd74156)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/522fb00e-b293-4dab-ae2a-0b80435219a9)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/27b8cfe1-0d3d-4d28-9f92-fbd760835ae3)

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

### IAM
Upon completion of infrastructure infrastructure, a user will be created who will supervise the work

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/90435ae6-efc3-4718-9e84-8596d932c104)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/23d81030-26c3-4860-b49a-e4f3aa8aaab1)
```
Statement = [
      {
        "Action" : [
          "ec2:Describe*"
        ],
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Action" : [
          "elasticloadbalancing:DescribeLoadBalancers"
        ],
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Action" : [
          "iam:GenerateCredentialReport",
          "iam:GenerateServiceLastAccessedDetails",
          "iam:Get*",
          "iam:List*",
          "iam:SimulateCustomPolicy",
          "iam:SimulatePrincipalPolicy"
        ],
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Action" : [
          "cloudwatch:DescribeAlarmsForMetric",
          "cloudwatch:DescribeAlarmHistory",
          "cloudwatch:DescribeAlarms",
          "cloudwatch:ListMetrics",
          "cloudwatch:GetMetricStatistics",
          "cloudwatch:GetMetricData",
          "cloudwatch:GetInsightRuleReport"
        ],
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Action" : [
          "autoscaling:Describe*",
        ],
        Effect   = "Allow"
        Resource = "*"
      },
    ]
```


### Result
The result of the work done

![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/7778d39d-a94d-4839-b8c0-e798c0f1acdc)






