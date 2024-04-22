pipeline {
    agent any
    environment {
        registry = "docker.io"
        devImageName = "gowthamsharoon/dev:latest"
        prodImageName = "gowthamsharoon/prod:latest"
        dockerImage = docker.image("${registry}/${devImageName}")
    }
    stages {
        stage('Build and Push Image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        dockerImage.build()
                        docker.withRegistry('https://index.docker.io/v1/', '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34') {
                            docker.image(devImageName).push()
                        }
                    } else if (env.BRANCH_NAME == 'master') {
                        dockerImage.build()
                        docker.withRegistry('https://index.docker.io/v1/', '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34') {
                            docker.image(prodImageName).push()
                        }
                    } else {
                        echo "Skipping Docker image build and push for branch ${env.BRANCH_NAME}"
                    }
                }
            }
        }
    }
}

