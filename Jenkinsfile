pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = 'vardhansneha' // Docker credentials ID
        DOCKER_REGISTRY_URL = 'https://index.docker.io/v1/' // Docker registry URL
        IMAGE_NAME = 'my-app-1.0'
        REPO_NAME = 'vardhan-project'
        TAG = 'latest'
        DOCKER_USERNAME = 'vardhansneha' // Your Docker Hub username
        AWS_CREDENTIALS_PATH = '/var/lib/jenkins/aws-credentials-pem' // Path to AWS credentials PEM
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/snehavardhandudaka/Ansible-Integration-in-Jenkins.git'
            }
        }
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${TAG}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Login to Docker registry
                        docker.withRegistry(DOCKER_REGISTRY_URL, DOCKER_CREDENTIALS_ID) {
                            def image = docker.image("${IMAGE_NAME}:${TAG}")
                            // Tag the image correctly
                            sh "docker tag ${IMAGE_NAME}:${TAG} ${DOCKER_USERNAME}/${REPO_NAME}:${TAG}"
                            // Push the image
                            sh "docker push ${DOCKER_USERNAME}/${REPO_NAME}:${TAG}"
                        }
                    }
                }
            }
        }
        stage('Deploy with Ansible') {
            steps {
                sshagent(['aws-credentials-pem']) {
                    script {
                        def controlNodeIP = '44.202.237.172'
                        def playbookPath = '/home/ubuntu/configure_ec2.yml'

                        // SCP the playbook to the remote server
                        sh """
                            scp -o StrictHostKeyChecking=no -i ${AWS_CREDENTIALS_PATH} configure_ec2.yml ubuntu@${controlNodeIP}:${playbookPath}
                        """

                        // Run commands on the remote server
                        sh """
                            ssh -o StrictHostKeyChecking=no -i ${AWS_CREDENTIALS_PATH} ubuntu@${controlNodeIP} '
                            sudo apt update && sudo apt install -y ansible python3-pip
                            python3 -m venv myenv
                            source myenv/bin/activate
                            pip install boto3
                            ansible-playbook ${playbookPath}
                            '
                        """
                    }
                }
            }
        }
    }
    post {
        failure {
            echo 'Build failed!'
        }
        success {
            echo 'Build succeeded!'
        }
    }
}
