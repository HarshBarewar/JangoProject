pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'harshproject'
        DOCKER_HUB_USERNAME = 'harshbarewar'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/HarshBarewar/JangoProject.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    script {
                        sh 'docker tag $DOCKER_IMAGE $DOCKER_HUB_USERNAME/$DOCKER_IMAGE'
                        sh 'docker push $DOCKER_HUB_USERNAME/$DOCKER_IMAGE'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d -p 8000:8000 $DOCKER_HUB_USERNAME/$DOCKER_IMAGE'
                }
            }
        }
    }
}
