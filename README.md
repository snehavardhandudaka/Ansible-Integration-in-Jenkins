# Ansible-Integration-in-Jenkins

What did you build? In this project, I set up a complete CI/CD pipeline to automate the deployment and management of cloud infrastructure. Here’s what I did:
1. Jenkins Server: I set up a Jenkins server to manage CI/CD processes.
2. Ansible Control Node: I created a dedicated server to run Ansible, which is a tool for automating server configurations.
3. Ansible Playbook: I wrote an Ansible playbook to configure two Amazon EC2 instances, including setting up Docker and 
   deploying a Docker container.

What did you learn?
1. CI/CD Integration: How to integrate Jenkins with Ansible to automate software deployment.
2. Remote Automation: How to manage and configure remote servers using Ansible.
3. Cloud Infrastructure: How to set up and manage EC2 instances on AWS.
4. Docker Deployment: How to deploy Docker containers on cloud servers.
5. Credential Management: Best practices for securely managing SSH keys and other credentials.

Technologies Used:
* Ansible: For automating server configuration and deployment tasks.
* Jenkins: To manage and execute the CI/CD pipeline.
* AWS: For provisioning and managing the EC2 instances.
* Docker: To containerize and deploy the application.
* Java & Maven: Used to build the Java application.
* Boto3: Python library for interacting with AWS services.
* Linux & Git: Used for server operations and version control.

What I Did:
1. Set Up Jenkins: I set up a Jenkins server to handle the CI/CD pipeline.
2. Configured Ansible Control Node: I set up another server to run Ansible. This server was configured with Ansible, 
   Python3, and Boto3.
3. Developed Ansible Playbook: I created a playbook that configures two EC2 instances. This includes installing Docker and 
   deploying my application in a Docker container.
4. Configured Jenkins with SSH Keys: I added SSH keys in Jenkins to allow it to securely access the Ansible server and EC2 
   instances.
5. Automated Deployment with Jenkins: Jenkins was set up to:
     1. Connect to the Ansible server.
     2.Upload the playbook and configuration files.
     3. Install necessary tools on the Ansible server.
     4. Run the playbook to configure the EC2 instances and deploy the application.
This setup ensures that my application is automatically deployed and managed on cloud servers, streamlining the development and deployment process.
