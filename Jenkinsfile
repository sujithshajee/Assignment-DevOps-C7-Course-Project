/* groovylint-disable CompileStatic, GStringExpressionWithinString */
pipeline {
    environment {
        registry = '280661052493.dkr.ecr.us-east-1.amazonaws.com/app'
        registryCredential = 'AWS_JENKINS_CREDENTIAL'
    }
    agent any
    stages {
        stage('Repo Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/sujithshajee/Assignment-DevOps-C7-Course-Project-nodeapp.git'
            }
        }
        stage('Build image') {
            steps {
                script {
                    app_build_number = docker.build(registry + ":$BUILD_NUMBER")
                    app_latest = docker.build(registry + ":latest")
                }
            }
        }
        stage('Push image') {
            steps {
                script {
                    /* groovylint-disable-next-line NestedBlockDepth */
                    docker.withRegistry('https://' + registry, 'ecr:us-east-1:' + registryCredential) {
                        app_build_number.push()
                        app_latest.push()
                    }
                }
            }
        }
        stage('Deploy image') {
            steps {
                sh 'chmod +x /tmp/scripts/deployImage.sh'
                sh 'deployImage.sh'
            }
        }
    }
}