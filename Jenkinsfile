pipeline {
    agent any
    environment {
        // Define environment variables for Docker registry credentials
        DOCKER_CREDENTIALS_ID = 'DOCKER-HUB' // Replace with your Jenkins Docker credentials ID
        DOCKER_REGISTRY_URL = 'docker.io'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/snehavardhandudaka/Ansible-Integration-in-Jenkins.git'
            }
        }
        stage('Build with Maven') {
            steps {
                script {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t myapp:latest .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login https://index.docker.io/v1/ -u $DOCKER_USERNAME --password-stdin'
                    }
                    sh 'docker tag myapp:latest $DOCKER_USERNAME/myapp:latest'
                    sh 'docker push $DOCKER_USERNAME/myapp:latest'
                }
            }
        }
        stage('Deploy with Ansible') {
            steps {
                sshagent(['TWN-KP.pem']) {
                    script {
                        def controlNodeIP = '44.202.237.172'
                        def playbookPath = '/home/ubuntu/configure_ec2.yml'

                        sh "scp -i ~/TWN-KP.pem configure_ec2.yml ubuntu@${controlNodeIP}:${playbookPath}"
                        sh """
                            ssh -i ~/TWN-KP.pem ubuntu@${controlNodeIP} 'sudo apt update && sudo apt install -y ansible python3-pip'
                            ssh -i ~/TWN-KP.pem ubuntu@${controlNodeIP} 'pip3 install boto3'
                            ssh -i ~/TWN-KP.pem ubuntu@${controlNodeIP} 'ansible-playbook ${playbookPath}'
                        """
                    }
                }
            }
        }
    }
}
