pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        AWS_ACCOUNT_ID = '734509083460'
        ECR_REPO_NAME = 'my-new-repo'
        ECR_REPOSITORY = '734509083460.dkr.ecr.ap-south-1.amazonaws.com/my-new-repo'
        ECS_CLUSTER = 'AppCluster'
        ECS_SERVICE = 'simple-service'
        TASK_FAMILY = 'Task'
        IMAGE_TAG = "${env.BUILD_ID}"
        AWS_CREDENTIALS = credentials('aws-credentials')
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build & Tag Docker Image') {
            steps {
                script {
                    sh "docker build -t ${ECR_REPOSITORY}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Login to AWS ECR') {
            steps {
                script {
                    sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPOSITORY}"
                }
            }
        }

        stage('Push Docker Image to ECR') {
            steps {
                script {
                    sh "docker push ${ECR_REPOSITORY}:${IMAGE_TAG}"
                }
            }
        }

        
    }

    post {
        always {
            cleanWs()
        }
    }
}
