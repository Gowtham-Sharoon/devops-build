pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'sh build.sh'  // Corrected the shell command execution syntax
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
                        docker.image('gowthamsharoon/dev').push()  // Corrected the image name
                    }
                    echo 'Pushed to Docker Hub on Dev repo'
                }
            }
        }
        stage('Push to Docker Hub Prod') {
            when {
                branch 'master'  // Changed to 'master' branch for production deployments
            }
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34') {
                        docker.image('gowthamsharoon/prod').push()  // Corrected the image name
                    }
                    echo 'Pushed to Docker Hub on Prod repo'
                }
            }
        }
    }
}

