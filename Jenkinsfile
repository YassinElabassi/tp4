pipeline {
    agent any                        // Jenkins exécutera les étapes sur la machine maître (Windows)

    environment {
        IMAGE_NAME  = 'my-python-app'
        REGISTRY    = credentials('docker-hub-credentials')      // ID configuré dans Jenkins
    }

    stages {

        stage('Build Docker image') {
            steps {
                echo "Building ${IMAGE_NAME}..."
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Tests (placeholder)') {
            steps {
                echo 'Running tests...'
                // Ajoute ici tes tests (pytest, unittest, etc.)
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo "Pushing ${IMAGE_NAME} to Docker Hub..."
                sh """
                   docker login -u ${REGISTRY_USR} -p ${REGISTRY_PSW}
                   docker tag ${IMAGE_NAME} ${REGISTRY_USR}/${IMAGE_NAME}:latest
                   docker push ${REGISTRY_USR}/${IMAGE_NAME}:latest
                """
            }
        }

        // Décommenter si tu veux déployer automatiquement
        /*
        stage('Deploy to remote server') {
            steps {
                sshagent(credentials: ['ssh-remote-server']) {
                    sh '''
                        ssh user@remote-server "
                          docker pull ${REGISTRY_USR}/${IMAGE_NAME}:latest &&
                          docker stop ${IMAGE_NAME} || true &&
                          docker rm ${IMAGE_NAME}   || true &&
                          docker run -d -p 5000:5000 --name ${IMAGE_NAME} ${REGISTRY_USR}/${IMAGE_NAME}:latest
                        "
                    '''
                }
            }
        }
        */
    }
}
