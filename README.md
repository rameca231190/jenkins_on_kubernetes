# k8-jenkins

Setup Jenkins On Kubernetes Cluster 

For setting up a Jenkins cluster on Kubernetes, we will do the following.


1.Create a Namespace

2.Create a deployment yaml and deploy it.

3.Create a service yaml and deploy it.

4.Access the Jenkins application on a Node Por


Create A Jenkins Deployment

1. Create a Namespace for Jenkins. So that we will have an isolation for the CI/CD environment.


kubectl create ns jenkins


2. Create a Deployment file named jenkins-deployment.yaml the latest Jenkins Docker Image.


3. Create the jenkins deployment in jenkins namespace using the following command.


kubectl create -f jenkins-deployment.yaml --namespace=jenkins


4. Now, you can get the deployment details using the following command.


kubectl  describe deployments --namespace=jenkins


 5.Create a jenkins-service.yaml file with the following contents.
 
 
 6. Create the jenkins service using the following command.
 

kubectl create -f jenkins-service.yaml --namespace=jenkins


Now if you browse to any one of the Node IP on port 31111, you will be able to access the Jenkins dashboard.


 7.Jenkins will ask for initial Admin password. You can get that from the pod logs either from kubernetes dashboard or  CLI. You can get the pod details using the following CLI command.


kubectl get pods --namespace=jenkins


8.And with the pod name, you can get the logs as shown below. replace the pod name with your pod name.



kubectl logs jenkins-deployment-..... --namespace=jenkins


The password can be found at the end of the log as shown below.

###Good Luck!!!!



