
pipeline {
    agent any

    environment {
        APP_NAME = 'my-python-app'
        APP_ENV = 'dev'
    }

    stages {
        stage('Environment Info') {
            steps {
                sh 'whoami'
                sh 'hostname'
                sh 'pwd'
                sh 'echo "Build Number: $BUILD_NUMBER"'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Building $APP_NAME in $APP_ENV environment"'
                sh 'python3 app/app.py'
            }
        }

        stage('Test') {
            steps {
                sh 'python3 tests/test_app.py'
            }
        }

        stage('Package') {
            steps {
                sh 'mkdir -p dist'
                sh 'tar -czf dist/${APP_NAME}-${BUILD_NUMBER}.tar.gz app tests'
                archiveArtifacts artifacts: 'dist/*.tar.gz', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed! Check Console Output.'
        }
    }
}
