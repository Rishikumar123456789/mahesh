pipeline {
    agent { label 'java-node' }

    tools {
        jdk 'java17'
        maven 'maven-3'
    }

    environment {
        IMAGE_NAME = "rishikumarandugala/mahesh"
        IMAGE_TAG = "1.0"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/Rishikumar123456789/mahesh.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker stop mahesh-container || true
                docker rm mahesh-container || true
                docker run -d -p 8081:8761 --name mahesh-container $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }

    }
}