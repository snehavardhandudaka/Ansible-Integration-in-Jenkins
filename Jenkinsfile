pipeline {
    agent any
    
    environment {
        ANSIBLE_HOST = '159.223.114.19'  // Replace with your Ansible Control Node's IP address
        SSH_KEY_CREDENTIALS_ID = 'local-TWN-SSH'  // Replace with your SSH key credentials ID
        USERNAME = 'LOCAL-SSH-PUBLIC'  // Replace with your SSH username for the Ansible Control Node
        PLAYBOOK_PATH = 'ansible/playbooks/ansible-playbook.yml'  // Path to your Ansible playbook
    }

    stages {
        stage('Setup Ansible Control Node') {
            steps {
                sshagent(credentials: [env.SSH_KEY_CREDENTIALS_ID]) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${env.USERNAME}@${env.ANSIBLE_HOST} << EOF
                    sudo apt update
                    sudo apt install -y ansible python3-pip
                    pip3 install boto3
                    mkdir -p ~/ansible/playbooks
                    EOF
                    """
                }
            }
        }

        stage('Copy Playbook to Ansible Control Node') {
            steps {
                sshagent(credentials: [env.SSH_KEY_CREDENTIALS_ID]) {
                    sh """
                    scp -o StrictHostKeyChecking=no ansible/playbooks/ansible-playbook.yml ${env.USERNAME}@${env.ANSIBLE_HOST}:~/ansible/playbooks/
                    """
                }
            }
        }

        stage('Execute Ansible Playbook') {
            steps {
                sshagent(credentials: [env.SSH_KEY_CREDENTIALS_ID]) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${env.USERNAME}@${env.ANSIBLE_HOST} 'ansible-playbook ~/ansible/playbooks/ansible-playbook.yml'
                    """
                }
            }
        }
    }
}
        // Optional: Additional stages for building and deploying your application
        stage('Build Application') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t your-docker-image-name .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push your-docker-image-name'
            }
        }
    }
}
