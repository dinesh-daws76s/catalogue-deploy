pipeline {
    agent any
    environment {
          packageVersion = ''
          NEXUS_URL = '3.88.31.126:8081'
          }
   parameters {
        string (name: 'version', defaulvalue: '1.0.0', description: 'what is artifact versioń')
        string (name: 'environment', defaulvalue: 'dev', description: 'what is the environment')
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
