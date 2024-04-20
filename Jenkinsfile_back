pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34'
        DEV_REPO = 'gowthamsharoon/dev'
        PROD_REPO = 'gowthamsharoon/prod'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    docker.build(env.BRANCH_NAME == 'master' ? PROD_REPO : DEV_REPO)
                }
            }
        }
        stage('Push to Docker Hub') {
            when {
                expression { env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'dev' }
            }
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        docker.image(env.BRANCH_NAME == 'master' ? PROD_REPO : DEV_REPO).push()
                    }
                }
            }
        }
    }
}

