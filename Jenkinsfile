pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34'
        DEV_IMAGE_NAME = 'gowthamsharoon/dev'
        PROD_IMAGE_NAME = 'gowthamsharoon/prod'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('guvi-app-prod')
                }
            }
        }
        stage('Push to Docker Hub Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    echo 'Pushing to Docker Hub repository: ' + DEV_IMAGE_NAME
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        echo 'Logged in to Docker Hub'
                        docker.image(DEV_IMAGE_NAME).push('latest')
                    }
                    echo 'Pushed to Docker Hub on Dev'
                }
            }
        }
        stage('Push to Docker Hub Prod') {
            steps {
                script {
                    echo 'Pushing to Docker Hub repository: gowthamsharoon/prod'
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        echo 'Logged in to Docker Hub'
                        docker.image('gowthamsharoon/prod').push('latest')
                    }
                    echo 'Pushed to Docker Hub on prod'
                }
            }
        }

    }
}

