pipeline {
    agent any

    stages {
        stage('Build and Test') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Deploy') {
            steps {
                sh 'sudo docker-compose -f docker-compose-development.yml build'
                sh 'sudo docker-compose -f docker-compose-development.yml up -d'
            }
        }
    }
}
