pipeline {
    agent { label 'java-node' }

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/Rishikumar123456789/myapplications.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t rishikumar/myapp:1.0 .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push rishikumar/myapp:1.0'
            }
        }

    }
}