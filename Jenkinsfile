pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/11Hemant/My-Jenki-Terra-1st-Project.git']])
            }
        }
        
    
        stage ("terraform init") {
            steps {
                sh ("terraform init -reconfigure") 
            }
        }
        
        stage ("plan") {
            steps {
                sh ('terraform plan') 
            }
        }

        stage('Apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}