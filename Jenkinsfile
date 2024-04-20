pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('gowthamsharoon/dev')
                }
            }
        }
        stage('Push to Docker Hub Dev') {
            when {
                expression {
                    env.BRANCH_NAME == 'dev'
                }
            }
            steps {
                script {
                    echo 'Pushing to Docker Hub repository: gowthamsharoon/dev'
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        echo 'Logged in to Docker Hub'
                        docker.image('gowthamsharoon/dev').push('latest')
                    }
                    echo 'Pushed to Docker Hub on Dev'
                }
            }
        }

        stage('Push to Docker Hub Prod') {
            when {
                expression {
                    env.BRANCH_NAME == 'master'
                }
            }
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
// Add error handling in Jenkins pipeline
pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('gowthamsharoon/dev')
                }
            }
        }
        stage('Push to Docker Hub Dev') {
            when {
                expression {
                    env.BRANCH_NAME == 'dev'
                }
            }
            steps {
                script {
                    try {
                        docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                            echo 'Logged in to Docker Hub'
                            docker.image('gowthamsharoon/dev').push('latest')
                        }
                    } catch (Exception e) {
                        echo "Failed to push to Docker Hub: ${e.message}"
                    }
                }
            }
        }
    }
}

