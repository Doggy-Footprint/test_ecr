pipeline {
    agent any
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
