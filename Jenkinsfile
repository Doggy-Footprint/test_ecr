pipeline {
    agent {
        docker {
            image 'openjdk:21-jdk-slim'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'chmod +x ./gradlew'
                    sh './gradlew clean build'
                }
            }
        }
        stage('Docker Build & Push') {
            steps {
                script {
                    docker.build('test_ecr')
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Stop and remove any existing container named 'test_ecr', then run a new one
                    sh '''
                        docker stop test_ecr || true
                        docker rm test_ecr || true
                        docker run -d -p 8081:8081 --name test_ecr test_ecr
                    '''
                }
            }
        }
    }
}
