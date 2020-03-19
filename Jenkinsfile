pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ahmadgbg/jenkinsPipeline.git'
            }
        }
        stage('newman') {
            steps {
                sh 'newman run Restful Booker.postman_collection.json --environment Restful Booker.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                }
            }
        }
    }
}