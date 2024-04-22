pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    docker.build("guvi-app-prod")
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
                        docker.image('guvi-app-prod').push('dev')
                    }
                }
            }
        }

        stage('Push to Docker Hub Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34') {
                        docker.image('guvi-app-prod').push('prod')
                    }
                }
            }
        }
    }
}

