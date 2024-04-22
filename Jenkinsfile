pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def dockerImage = 'guvi-app-prod'
                    sh "docker build -t $dockerImage ."
                    // Check if the build was successful
                    if (sh(script: "docker images $dockerImage", returnStatus: true) != 0) {
                        error 'Docker build failed'
                    }
                }
            }
        }
        stage('Push to Docker Hub Prod') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'DOCKERHUB_CREDENTIALS', url: 'https://index.docker.io/v1/']) {
                        sh "docker push gowthamsharoon/prod:latest"
                    }
                }
            }
        }
    }
}

