# Step - 1 : Create EKS Management Host in AWS #

1) Launch new Ubuntu VM using AWS Ec2 ( t2.micro )	  
2) Connect to machine and install kubectl using below commands  
```
curl -o kubectl https://amazon-eks.s3.ap-south-1.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client
```
3) Install AWS CLI latest version using below commands 
```
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

4) Install eksctl using below commands
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```
# Step - 2 : Create IAM role & attach to EKS Management Host #

1) Create New Role using IAM service ( Select Usecase - ec2 ) 	
2) Add below permissions for the role <br/>
	- Administrator - acces <br/>
		
3) Enter Role Name (eksroleec2) 
4) Attach created role to EKS Management Host (Select EC2 => Click on Security => Modify IAM Role => attach IAM role we have created) 

# Step - 3 : Create EKS Cluster using eksctl # 
**Syntax:** 

eksctl create cluster --name cluster-name  \
--region region-name \
--node-type instance-type \
--nodes-min 2 \
--nodes-max 2 \ 
--zones <AZ-1>,<AZ-2>

## N. Virgina: <br/>
`
eksctl create cluster --name yashu-cluster4 --region us-east-1 --node-type t2.medium  --zones us-east-1a,us-east-1b
`	
## Mumbai: <br/>
`
eksctl create cluster --name yashu-cluster4 --region ap-south-1 --node-type t2.medium  --zones ap-south-1a,ap-south-1b
`

## Note: Cluster creation will take 5 to 10 mins of time (we have to wait). After cluster created we can check nodes using below command.

`
 kubectl get nodes  
`

# Note: We should be able to see EKS cluster nodes here.**

# We are done with our Setup #
	
# Step - 4 : After your practise, delete Cluster and other resources we have used in AWS Cloud to avoid billing #

```
eksctl delete cluster --name yashu-cluster4 --region ap-south-1
```

# Method 1: Using curl
Download the kubectl Binary:

#For x86-64 systems
curl -LO "https://dl.k8s.io/release/$(curl -L -s 
https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#For ARM64 systems
curl -LO "https://dl.k8s.io/release/$(curl -L -s 
https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"

# Validate the Binary (optional):
#Download the checksum file
curl -LO "https://dl.k8s.io/release/$(curl -L -s 
https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# Validate the binary
echo "$(cat kubectl.sha256) kubectl" | sha256sum --check


# Install kubectl:
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


# Verify Installation:
kubectl version --client
