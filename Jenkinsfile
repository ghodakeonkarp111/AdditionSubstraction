pipeline {
    agent any 
    stages {
        stage('Clean') { 
            steps {
                bat "mvn clean"
            }
        }
        stage('Test') { 
            steps {
               bat "mvn test"
            }
        }
        stage('Package') { 
            steps {
                bat "mvn package" 
            }
        }
		stage('Generate Mail') { 
            steps {
               mail bcc: '', body: 'Sample body', cc: '', from: '', replyTo: '', subject: 'Sample Subject', to: 'ghodakeonkarp111@gmail.com'
            }
        }
		
    }
}