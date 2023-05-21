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

        stage('Action') {
            steps {
                input {
                    message "Choose an action to perform"
                    parameters {
                        choice(
                            choices: ['Apply', 'Destroy'],
                            description: 'Select an action'
                        )
                    }
                }
            }
        }

        stage('Apply') {
            when {
                expression { params.choice == 'Apply' }
            }
            steps {
                sh 'terraform apply --auto-approve'
            }
        }

        stage('Destroy') {
            when {
                expression { params.choice == 'Destroy' }
            }
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}