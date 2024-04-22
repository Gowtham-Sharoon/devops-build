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
                        docker.image('guvi-app-prod').push('prod')
                    }
                    echo 'Pushed to Docker Hub on Prod repo'
                }
            }
        }
    }
}

