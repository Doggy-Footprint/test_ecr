pipeline {
    agent {
        docker {
            image 'tomcat:11.0-jre21'
            args '-v /c/Users/khs19/.jenkins/workspace/test_ecr/:/home/gradle/project'
        }
    }
    environment {
        DOCKER_IMAGE_NAME = "test-ecr-docker-image"
        DOCKER_REGISTRY = "test-ecr-docker-registry"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'chmod +x ./gradlew'
                    sh './gradlew clean build'
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
