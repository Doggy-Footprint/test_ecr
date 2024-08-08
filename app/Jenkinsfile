pipeline {
    agent any
    environment {
        ECR_REGISTRY = 'your-account-id.dkr.ecr.your-region.amazonaws.com'
        ECR_REPOSITORY = 'your-repo-name'
        IMAGE_TAG = "${env.BUILD_ID}"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    sh './gradlew clean build'
                }
            }
        }
        stage('Docker Build & Push') {
            steps {
                script {
                    docker.withRegistry("https://${ECR_REGISTRY}", 'ecr:aws-credentials-id') {
                        def app = docker.build("${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}")
                        app.push()
                        app.push('latest')
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sshagent(['your-ssh-credentials-id']) {
                        sh '''
                        ssh -o StrictHostKeyChecking=no user@your-server "
                        docker pull ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG} &&
                        docker stop your-container-name || true &&
                        docker rm your-container-name || true &&
                        docker run -d -p 8080:8080 --name your-container-name ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}"
                        '''
                    }
                }
            }
        }
    }
}
