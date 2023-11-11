pipeline {
    agent any
   
    environment {
        // Retrieve Docker Hub password from Jenkins credentials
        DOCKER_HUB_PASSWORD = credentials('CredentialID_DockerHubPWD')
    }
    stages {
        stage("Check out") {
            steps {
                git url: 'https://github.com/ralmuetecentennialgit/comp367_lab2', branch: 'main'
            }
        }

        stage("Build Maven Project") {
            steps {
                // Using Maven defined in the 'tools' section, no need to specify path
                bat 'mvn clean install'
            }
        }
		
		stage("Unit Test") {
            steps {
                // Maven test, assuming tests are configured in your project
                sh 'mvn test'
            }
        }

        stage("Docker Build") {
            steps {
                // Build Docker image
                sh 'docker build -t ralmuetecentennial/mavenproject4docker:1.2 .'
            }
        }

        stage("Docker Login") {
            steps {
                // Docker login using environment variable for password
                sh 'echo $DOCKER_HUB_PASSWORD | docker login -u ralmuetecentennial --password-stdin'
            }
        }

        stage("Docker Push") {
            steps {
                // Push image to Docker Hub
                sh 'docker push ralmuetecentennial/mavenproject4docker:1.2'
            }
        }
    }
}
