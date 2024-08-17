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
    }
}
