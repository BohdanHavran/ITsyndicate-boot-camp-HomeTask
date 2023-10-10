# Kubernetes Quick Start

In this task, I used Terraform to raise the infrastructure including Database and Kubernetes and Helm to deploy the application in a Kubernetes cluster. If you don't have [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform), [Helm](https://helm.sh/) or [Helmfile](https://github.com/helmfile/helmfile) installed, you need to install!

# How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask.git
```
```
cd ITsyndicate-boot-camp-HomeTask/Week_7-Kubernetes-Quick-Start
```
In order to run this project, you need to enter the following commands:
```
terraform init
```
```
terraform apply --auto-approve
```
After the infrastructure is up, we recommend executing the following commands
```
export KUBECONFIG=$PWD/django-kubeconfig.yaml
```
```
export HELM_KUBECONTEXT=$(kubectl config get-contexts | awk '{print $2}' | grep -v NAME)
```
```
helmfile apply -f helm/helmfile.yaml
```
If you need to remove a project:
```
helmfile destroy -f helm/helmfile.yaml
```
```
terraform destroy --auto-approve
```

### Kubernets
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/74cfbee2-6594-400b-bd77-420ad1e1dd2c)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/2c61ff6b-bfcf-418c-9618-df2f54d654be)

### Database
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/a9e60ace-4f50-44bf-a9a1-a2e3fd7269a3)
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/4f54372f-c36c-4ce1-9a68-f70f1585c476)

### Manifest
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/9a032141-c3b7-493c-99e3-2bee3497a50b)
```
kubectl get all
```
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/c281b3dd-34e1-4d2d-befd-f3db40076472)
```
kubectl get certificates
```
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/72d1d3d5-2392-4b62-8fef-9ff3e4c2c39f)
```
kubectl get ingress
```
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/bf9d438b-da37-478e-82ee-b556aad2c74c)

### Learn about Persistent Volumes, Persistent Volume Claims, and Storage Classes in Kubernetes

Persistent Volumes (PVs): These are resources in a Kubernetes cluster that provide durable storage for applications. PVs abstract the underlying storage infrastructure, allowing you to use different types of storage, such as local storage, network-attached storage (NAS), or cloud storage, without modifying your application code.

Persistent Volume Claims (PVCs): PVCs are requests for storage by applications in Kubernetes. They are used by pods (applications) to claim a specific amount of storage from available PVs. PVCs provide a way for applications to get the storage they need without needing to know the details of the underlying storage infrastructure.

Storage Classes: Storage Classes are used to define different classes of storage in a Kubernetes cluster. They specify the provisioner (the plugin responsible for creating PVs) and other parameters for dynamically provisioning PVs. Storage Classes allow you to create PVs on-demand as PVCs are requested by applications.

PV Provisioning: Initially, a cluster administrator sets up one or more PVs by creating them in the cluster configuration. This can be done statically, meaning PVs are pre-provisioned and exist before any PVCs are created, or dynamically, where PVs are provisioned on-demand based on Storage Classes.

Storage Classes: Administrators define Storage Classes, each with specific attributes and a provisioner. The provisioner specifies which plugin or driver to use for creating the PV. For example, a Storage Class might specify that PVs should be created using AWS EBS volumes or local disks.

### Explain, how these concepts work together to provide persistent storage for applications running in Kubernetes.

PVC Request: When an application or a developer needs persistent storage for their pod, they create a PVC manifest specifying the required storage capacity, access mode, and the desired Storage Class.

PVC Binding: Kubernetes looks for a suitable PV that matches the PVC's requirements based on Storage Class and other criteria. If a matching PV is found, the PVC is bound to that PV.

Pod Attachment: Once the PVC is bound to a PV, the application pod can be deployed or updated with a reference to the PVC in its configuration. The pod can then use the mounted PVC as persistent storage.

# Result
![image](https://github.com/BohdanHavran/ITsyndicate-boot-camp-HomeTask/assets/7732624/9a10d962-ad47-4172-afd8-514275bc2a39)

