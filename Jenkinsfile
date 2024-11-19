pipeline {
    agent any
    environment {
          packageVersion = ''
          NEXUS_URL = '50.17.156.242:8081'
          environment {
          AWS_ACCESS_KEY_ID = 'AKIAT72HVGKWYUSA6IEN'
          AWS_SECRET_ACCESS_KEY = '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'
          AWS_REGION = 'us-east-1'
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
}
