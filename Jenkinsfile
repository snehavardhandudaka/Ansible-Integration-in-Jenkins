pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Pull source code from Git
                git 'https://github.com/snehavardhandudaka/Ansible-Integration-in-Jenkins.git'
            }
        }
        stage('Build with Maven') {
            steps {
                script {
                    // Run Maven to build the application
                    sh 'mvn clean package'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t myapp:latest .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push Docker image to Docker Hub or another registry
                    sh 'docker tag myapp:latest your-docker-repo/myapp:latest'
                    sh 'docker push your-docker-repo/myapp:latest'
                }
            }
        }
        stage('Deploy with Ansible') {
            steps {
                sshagent(['TWN-KP.pem']) {
                    script {
                        def controlNodeIP = '44.202.237.172'
                        def playbookPath = '/home/ubuntu/configure_ec2.yml'

                        // Connect to Ansible Control Node, copy playbook
                        sh "scp -i ~/TWN-KP.pem configure_ec2.yml ubuntu@${controlNodeIP}:/home/ubuntu/"
                        
                        // Install dependencies and run playbook
                        sh """
                            ssh -i ~/TWN-KP.pem ubuntu@${controlNodeIP} 'sudo apt update'
                            ssh -i ~/TWN-KP.pem ubuntu@${controlNodeIP} 'sudo apt install -y ansible python3-pip'
                            ssh -i ~/TWN-KP.pem ubuntu@${controlNodeIP} 'pip3 install boto3'
                            ssh -i ~/TWN-KP.pem ubuntu@${controlNodeIP} 'ansible-playbook /home/ubuntu/configure_ec2.yml'
                        """
                    }
                }
            }
        }
    }
}

