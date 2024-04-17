pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/aditya-sridhar/simple-reactjs-app.git'
            }
        }
        
        stage('Dependency Installation') {
            steps {
                bat 'npm install'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('my-web-app')
                }
            }
        }
        
        stage('Run Docker Image') {
            steps {
                script {
                    docker.image('my-web-app').run("-p 8080:80 -d")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image('my-web-app').push('latest')
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline execution failed!'
        }
    }
}
