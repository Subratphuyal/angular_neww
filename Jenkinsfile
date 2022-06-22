pipeline {
  agent{
    dockerfile true
  }
  environment {
        aws_credential = "aws_credentailss"
        bucket = "subrat-angular-test"
        region = "us-east-1"
        file = ""dist/new_angular_app*
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
              withAWS(region:"${region}", credentials:"${aws_credential})
                script {
                sh '''
                s3Upload(file:"${file}", bucket:"${bucket}")
                  '''
                }
            }
        }
        
    }
}
