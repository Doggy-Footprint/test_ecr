pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'gradle clean build'
                    sh 'gradle test'
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // If you want to use ECR search how to push docker image to AWS ECR(elastic container registry)
                    
                    docker.build("test-ecr:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Example deployment step
                    sh 'docker run -d -p 8081:8081 test-ecr:${env.BUILD_NUMBER}'
                }
            }
        }
    }

    // post {
    //     always {
    //         cleanWs()
    //     }
    //     success {
    //         echo 'Build and deployment succeeded!'
    //     }
    //     failure {
    //         echo 'Build or deployment failed.'
    //     }
    // }
}
