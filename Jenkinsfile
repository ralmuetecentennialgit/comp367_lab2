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

        stage("Docker Login") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
            bat "echo %DOCKER_HUB_PASSWORD% | docker login -u %DOCKER_HUB_USERNAME% --password-stdin"
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
