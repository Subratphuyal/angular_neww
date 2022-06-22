pipeline {
  agent{
    dockerfile true
  }
  environment {
        aws_credential = "aws_credentailss"
        bucket = "subrat-angular-test"
        region = "us-east-1"
        file = "dist/new_angular_app*"
  }      
  tools {nodejs "node_js"}
      
    stages{
      stage('installing yarn') {
            steps {
                script {
                sh '''
                yarn
                  '''
                }
            }
        }
        
        stage('building step') {
            steps {
                script {
                sh '''
                yarn build
                  '''
                }
            }
        }
        stage('upload artifacts to s3') {
            steps {
              withCredentials([file(credentialsId: 'aws_credentialss', variable: 'aws_credential')]) {
                s3Upload(file:"${file}", bucket:"${bucket}")
    
            }
               
            }
        }
        
    }
}
