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
                script {
                    def userInput = input(
                        message: 'Choose an action to perform',
                        parameters: [
                            choice(
                                choices: ['Apply', 'Destroy'],
                                description: 'Select an action',
                                name: 'choice'
                            )
                        ]
                    )
                    env.CHOICE = userInput['choice']
                }
            }
        }

        stage('Apply') {
            when {
                expression { env.CHOICE == 'Apply' }
            }
            steps {
                sh 'terraform apply --auto-approve'
            }
        }

        stage('Destroy') {
            when {
                expression { env.CHOICE == 'Destroy' }
            }
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}