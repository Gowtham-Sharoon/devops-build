pipeline {
    agent any
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
                        branch 'dev'  // Run this stage only if the branch is 'dev'
                    }
                    steps {
                        script {
                            sh 'sh deploy-dev.sh'  // Run the deploy-dev.sh script for the 'dev' branch
                        }
                    }
                }
                stage('Deploy to Prod') {
                    when {
                        branch 'master'  // Run this stage only if the branch is 'master'
                    }
                    steps {
                        script {
                            sh 'sh deploy-prod.sh'  // Run the deploy-prod.sh script for the 'master' branch
                        }
                    }
                }
            }
        }
        stage('Push to Docker Hub') {
            when {
                branch 'master'  // Run this stage only if the branch is 'master'
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

