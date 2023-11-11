pipeline {
    agent any
    tools {
        // Specify the Maven installation to use.
        maven "MAVEN3"
    }
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
                bat  'docker build -t ralmuetecentennial/mavenproject4docker:1.2 .'
            }
        }

       stage('Docker Login') {
            steps {
                // Log in to Docker Hub using the environment variable for the password
                    bat "docker login -u ralmuetecentennial -p %DOCKER_HUB_PASSWORD%"
            }
        }

        stage("Docker Push") {
            steps {
                // Push image to Docker Hub
                bat  'docker push ralmuetecentennial/mavenproject4docker:1.2'
            }
        }
    }
}
