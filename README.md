# Ansible-Integration-in-Jenkins

What Did I Build?
In this project, I set up a complete CI/CD pipeline to automate the deployment and management of cloud infrastructure. Here’s what I built:
  1. Jenkins Server: I set up a Jenkins server to manage CI/CD processes.
  2. Ansible Control Node: I created a dedicated server to run Ansible, which is a tool for automating server configurations.
  3. Ansible Playbook: I wrote an Ansible playbook to configure two Amazon EC2 instances, including setting up Docker and 
     deploying a Docker container.
What Did I Learn?
  A. CI/CD Integration: How to integrate Jenkins with Ansible to automate software deployment.
  B. Remote Automation: How to manage and configure remote servers using Ansible.
  C. Cloud Infrastructure: How to set up and manage EC2 instances on AWS.
  D. Docker Deployment: How to deploy Docker containers on cloud servers.
  E. Credential Management: Best practices for securely managing SSH keys and other credentials.
Technologies Used:
   A. Ansible: For automating server configuration and deployment tasks.
   B. Jenkins: To manage and execute the CI/CD pipeline.
   C. AWS: For provisioning and managing the EC2 instances.
   D. Docker: To containerize and deploy the application.
   E. Java & Maven: Used to build the Java application.
   F. Boto3: Python library for interacting with AWS services.
   G. Linux & Git: Used for server operations and version control.
What I Did?
   A. Set Up Jenkins: I set up a Jenkins server to handle the CI/CD pipeline.
   B. Configured Ansible Control Node: I set up another server to run Ansible. This server was configured with Ansible, 
      Python3, and Boto3.
   C. Developed Ansible Playbook: I created a playbook that configures two EC2 instances, including installing Docker and 
      deploying my application in a Docker container.
   D. Configured Jenkins with SSH Keys: I added SSH keys in Jenkins to allow it to securely access the Ansible server and 
      EC2 instances.
   E. Automated Deployment with Jenkins: Jenkins was set up to:
        i. Connect to the Ansible server.
       ii. Upload the playbook and configuration files.
      iii. Install necessary tools on the Ansible server.
       iV. Run the playbook to configure the EC2 instances and deploy the application.
This setup ensures that my application is automatically deployed and managed on cloud servers, streamlining the development and deployment process.
