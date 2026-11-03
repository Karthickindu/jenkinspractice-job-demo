
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
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
                sh 'tar -czf dist/app.tar.gz app tests'
                archiveArtifacts artifacts: 'dist/*.tar.gz', fingerprint: true
            }
        }
    }
}
