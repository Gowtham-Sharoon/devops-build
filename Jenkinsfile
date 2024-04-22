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
        stage('Deploy') {
            steps {
                script {
                    println "Current branch: ${env.GIT_BRANCH}"
                    if (env.GIT_BRANCH == 'origin/dev') {
                        echo 'Deploying to Dev...'
                        sh 'sh deploy-dev.sh'
                    } else if (env.GIT_BRANCH == 'origin/master') {
                        echo 'Deploying to Prod...'
                        sh 'sh deploy-prod.sh'
                    } else {
                        echo 'Branch not recognized, skipping deployment'
                    }
                }
            }
        }
        stage('Push to Docker Hub') {
            when {
                expression { env.GIT_BRANCH == 'origin/master' }
            }
            steps {
                script {
                    echo 'Pushing to Docker Hub...'
                    docker.withRegistry('https://index.docker.io/v1/', '53fef10a-8c6e-4667-a3d2-a3b0e3c25a34') {
                        docker.tag('gowthamsharoon', 'index.docker.io/gowthamsharoon/prod', 'prod')
                        docker.image('index.docker.io/gowthamsharoon/prod').push()
                    }
                    echo 'Pushed to Docker Hub on Prod repo'
                }
            }
        }
    }
}

