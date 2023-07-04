pipeline {
    agent any

    environment {
        ECR_URL = '854171615125.dkr.ecr.us-west-1.amazonaws.com/portfolio'
        REPO_NAME = 'portfolio'
    }

    stages {
        stage('ECR authentication and Docker login') {
            steps {
                sh '''
                aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin ${ECR_URL}
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                docker build -t ${REPO_NAME} .
                '''
            }
        }

        stage('Push to ECR') {
            steps {
                sh '''
                docker tag ${REPO_NAME} ${ECR_URL}/${REPO_NAME}:0.0.${BUILD_NUMBER}
                docker push ${ECR_URL}/${REPO_NAME}:0.0.${BUILD_NUMBER}
                '''
            }
        }

        stage('Trigger Deploy') {
            steps {
                build job: 'PortfolioDeploy', wait: false, parameters: [
                    string(name: 'PORTFOLIO_IMAGE_URL', value: "${ECR_URL}/${REPO_NAME}:0.0.${BUILD_NUMBER}")
                ]
            }
        }
    }
}