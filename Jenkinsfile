pipeline {
    agent any

    stages {
	    stage('Github Repo clone') {
	        // Get some code from a GitHub repository
	        git url: 'https://github.com/Sameony/jenkins',
	            credentialsId: 'github-id',
	            branch: 'jenkins-docker'
	     }
		stage('Docker Build') {
            steps {
                sh 'docker build -t jenkins-docker .'
            }
        }
        stage('Docker deploy') {
            steps {
                sh 'docker run -d -p 8069:8069 jenkins-docker'
            }
        }
    }
}