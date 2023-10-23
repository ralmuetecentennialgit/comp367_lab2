pipeline {
    agent any
   tools {
    maven "Maven3.9"
   }
    stages {
        stage('Checkout') {
            steps {
                // Check out the source code
                checkout scm
            }
        }

        stage('Build Maven Project') {
            steps {
                // Run Maven build
                sh 'mvn clean install'
            }
        }

    }

    // Post-build actions, notifications, etc.
    post {
        success {
            // Add actions to perform on success (optional)
            echo "Build successful! Deploying to production..."
        }
        failure {
            // Add actions to perform on failure (optional)
            echo "Build failed! Sending failure notification..."
        }
        always {
            // Add actions to perform regardless of build result (optional)
            echo "Performing cleanup..."
        }
    }
}
