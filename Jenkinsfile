pipeline {
    agent any
    environment {
        IMAGE_NAME = 'my-python-app'
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo Building the Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'echo Pushing Docker image to Docker Hub...'
                sh 'docker login -u $DOCKER_HUB_CREDENTIALS_USR -p $DOCKER_HUB_CREDENTIALS_PSW'
                sh 'docker tag $IMAGE_NAME $DOCKER_HUB_CREDENTIALS_USR/$IMAGE_NAME:latest'
                sh 'docker push $DOCKER_HUB_CREDENTIALS_USR/$IMAGE_NAME:latest'
            }
        }
    }
}
