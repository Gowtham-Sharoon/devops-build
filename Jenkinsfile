pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // No need to build the image here since it's already built in build.sh
                    // docker.build("guvi-app-prod")
                }
            }
        }
        stage('Push to Docker Hub Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34') {
                        docker.image('guvi-app-prod').push('gowthamsharoon/dev')
                    }
                    echo 'Pushed to Docker Hub on Dev repo'
                }
            }
        }
        stage('Push to Docker Hub Prod') {
            when {
                expression {
                    true
                }
            }
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34') {
                        // Tag the image correctly
                        docker.image('guvi-app-prod').tag('gowthamsharoon/prod:latest')
                        // Push the tagged image
                        docker.image('gowthamsharoon/prod:latest').push()
                    }
                    echo 'Pushed to Docker Hub on Prod repo'
                }
            }
        }
    }
}

