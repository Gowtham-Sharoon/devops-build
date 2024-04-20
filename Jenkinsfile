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
        stage('Push to Docker Hub') {
            when {
                expression {
                    return env.BRANCH_NAME == 'dev' || env.BRANCH_NAME == 'master'
                }
            }
            steps {
                script {
                    def dockerRepo = 'gowthamsharoon/dev'
                    if (env.BRANCH_NAME == 'master') {
                        dockerRepo = 'gowthamsharoon/prod'
                    }

                    echo "Pushing to Docker Hub repository: $dockerRepo"
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        echo 'Logged in to Docker Hub'
                        docker.image(dockerRepo).push('latest')
                    }
                    echo 'Pushed to Docker Hub'
                }
            }
        }
    }
}

