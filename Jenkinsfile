pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t my-python-app .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh '''
                    docker login -u $DOCKER_HUB_CREDENTIALS_USR -p $DOCKER_HUB_CREDENTIALS_PSW
                    docker tag my-python-app $DOCKER_HUB_CREDENTIALS_USR/my-python-app:latest
                    docker push $DOCKER_HUB_CREDENTIALS_USR/my-python-app:latest
                '''
            }
        }
    }
}
