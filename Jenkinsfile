pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'anni05/event-master_1'  // Replace with your Docker Hub username
        DOCKER_TAG = 'latest'  // Tag for the Docker image
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                // Login to Docker Hub (Make sure Docker credentials are stored in Jenkins)
                script {
                    docker.withRegistry('', 'dockerhub_credentials') {
                        // DockerHub login will happen automatically
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the image to Docker Hub
                script {
                    docker.withRegistry('', 'dockerhub_credentials') {
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker images after build and push
            cleanWs()
        }
    }
}
