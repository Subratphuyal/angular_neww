pipeline {
  agent{
    dockerfile true
  }
  
  tools {nodejs "node_js"}
      
    stages{
      stage('installing npm') {
            steps {
                script {
                sh '''
                yarn
                  '''
                }
            }
        }
        
        stage('building packages') {
            steps {
                script {
                sh '''
                yarn build
                  '''
                }
            }
        }
        
    }
}
