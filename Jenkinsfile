pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    environment{
        def appVersion = '' //variable declaration
        nexusUrl = 'nexus.daws78s.online:8081'
    }
    parameters{
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the application version?')
    }
    stages {
        stage('print the version'){
            steps{
                script{
                    echo "App version: ${params.appVersion}"
                }
            }
        }
        stage('Init') {
            steps {
                sh """
                    cd terraform
                    terraform init -reconfigure
                """
            }
        }
        stage('Plan') {
            steps {
                sh """
                    cd terraform
                    terraform plan
                """
            }
        }

        stage('Deploy') {
            steps {
                sh """
                    cd terraform
                    terraform apply -var="app_version=${params.appVersion}" -auto-approve
                """
            }
        }

    }
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        success { 
            echo 'I will run when pipeline is success'
        }
        failure { 
            echo 'I will run when pipeline is failure'
        }
    }
}