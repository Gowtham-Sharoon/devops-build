pipeline {
    agent any
    environment {
        CURRENT_BRANCH = "${env.BRANCH_NAME}"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'sh build.sh'
                }
            }
        }
        stage('Deploy to Dev and Prod') {
            parallel {
                stage('Deploy to Dev') {
                    when {
                        expression { CURRENT_BRANCH == 'dev' }
                    }
                    steps {
                        script {
                            sh 'sh deploy-dev.sh'
                        }
                    }
                }
                stage('Deploy to Prod') {
                    when {
                        expression { CURRENT_BRANCH == 'master' }
                    }
                    steps {
                        script {
                            sh 'sh deploy-prod.sh'
                        }
                    }
                }
            }
        }
        stage('Push to Docker Hub') {
            when {
                expression { CURRENT_BRANCH == 'master' }
            }
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34') {
                        docker.image('gowthamsharoon').push('prod')
                    }
                    echo 'Pushed to Docker Hub on Prod repo'
                }
            }
        }
    }
}

