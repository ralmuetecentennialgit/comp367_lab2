pipeline {
    agent any
    tools {
        // Specify the Maven installation to use.
        maven "MAVEN3"
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
                bat  'mvn clean install'
            }
        }
		
		stage("Unit Test") {
            steps {
                // Maven test, assuming tests are configured in your project
                bat  'mvn test'
            }
        }

        stage("Docker Build") {
            steps {
                // Build Docker image
                bat  'docker build -t ralmuetecentennial/mavenproject4docker:1.3 .'
            }
        }

         stage('Docker Login') {
            steps {
                withCredentials([string(credentialsId: 'CredentialID_DockerHubPWD', variable: 'DOCKER_HUB_PASSWORD')]) {
                    bat "echo %DOCKER_HUB_PASSWORD% | docker login -u ralmuetecentennial --password-stdin"
                }
            }
        }

        stage("Docker Push") {
            steps {
                // Push image to Docker Hub
                bat  'docker push ralmuetecentennial/mavenproject4docker:1.3'
            }
        }
    }
}
