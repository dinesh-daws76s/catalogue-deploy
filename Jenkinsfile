pipeline {
  agent {
      node {
        label 'jenkins-node'
       }
     }
    environment {
          packageVersion = ''
          NEXUS_URL = '34.201.124.210:8081'

          }
   parameters {
        string (name: 'version', defaultValue: '', description: 'what is artifact versioń')
        string (name: 'environment', defaultValue: '', description: 'what is the environment')
    
   }

    stages {
        stage('Build') {
             steps {
                sh """
                      
                      echo "version: ${params.version}"
                      echo "environment: ${params.environment}"
  
                """
            }
        }
        stage('Terraform init ') {
             steps {
                sh """
                    ls
                    whoami
                    cd terraform
                    terraform init -reconfigure               
  
                """
            }
        }
    }
  post { 
    always {
        echo 'This will execute always when job executed'
        deleteDir()
    }
    success {
        sh """
          echo "JOB is successful"
        """
    }
    unsuccessful {
        echo 'This will execute at them time of job failed'
    }
  }
 }
