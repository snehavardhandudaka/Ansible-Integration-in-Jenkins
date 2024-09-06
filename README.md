# Ansible-Integration-in-Jenkins

What did you build? In this project, we set up a complete CI/CD pipeline to automate the deployment and management of cloud infrastructure. Here’s what we did:

Jenkins Server: We set up a Jenkins server to manage our CI/CD processes.
Ansible Control Node: We created a dedicated server to run Ansible, which is a tool for automating server configurations.
Ansible Playbook: We wrote an Ansible playbook to configure two Amazon EC2 instances, including setting up Docker and deploying a Docker container.
What did you learn?

CI/CD Integration: How to integrate Jenkins with Ansible to automate software deployment.
Remote Automation: How to manage and configure remote servers using Ansible.
Cloud Infrastructure: How to set up and manage EC2 instances on AWS.
Docker Deployment: How to deploy Docker containers on cloud servers.
Credential Management: Best practices for securely managing SSH keys and other credentials.
Technologies Used
Ansible: For automating server configuration and deployment tasks.
Jenkins: To manage and execute the CI/CD pipeline.
AWS: For provisioning and managing the EC2 instances.
Docker: To containerize and deploy the application.
Java & Maven: Used to build the Java application.
Boto3: Python library for interacting with AWS services.
Linux & Git: Used for server operations and version control.
What We Did
Set Up Jenkins: We set up a Jenkins server to handle our CI/CD pipeline.
Configured Ansible Control Node: We set up another server to run Ansible. This server was configured with Ansible, Python3, and Boto3.
Developed Ansible Playbook: We created a playbook that configures two EC2 instances. This includes installing Docker and deploying our application in a Docker container.
Configured Jenkins with SSH Keys: We added SSH keys in Jenkins to allow it to securely access the Ansible server and EC2 instances.
Automated Deployment with Jenkins: Jenkins was set up to:
Connect to the Ansible server.
Upload the playbook and configuration files.
Install necessary tools on the Ansible server.
Run the playbook to configure the EC2 instances and deploy the application.
This setup ensures that our application is automatically deployed and managed on cloud servers, streamlining the development and deployment process.
