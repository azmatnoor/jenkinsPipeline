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
                sh 'newman run "Restful Booker.postman_collection.json" --environment "Restful Booker.postman_environment.json" --reporters junit'
            }
         }
        stage('robot') {
             steps {
                 sh 'robot -d results --variable BROWSER:headlesschrome infotivTest.robot'
             }
             post {
                 always {
                     script {
                           step(
                                 [
                                   $class              : 'RobotPublisher',
                                   outputPath          : 'results',
                                   outputFileName      : '**/output.xml',
                                   reportFileName      : '**/report.html',
                                   logFileName         : '**/log.html',
                                   disableArchiveOutput: false,
                                   passThreshold       : 50,
                                   unstableThreshold   : 40,
                                   otherFiles          : "**/*.png,**/*.jpg",
                                 ]
                            )
                     }
                 }
             }
        }
        post {
            always {
                    junit '**/*xml'
            }
        }
    }
}