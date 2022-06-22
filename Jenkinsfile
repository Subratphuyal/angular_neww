def remote = [:]
remote.name = "angular_testts"
remote.host = "52.203.232.153"
remote.allowAnyHosts = true
pipeline {
  agent{
    dockerfile true
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
              withCredentials([sshUserPrivateKey(credentialsId: 'aws_credentailss', keyFileVariable: 'sshKey', passphraseVariable: '', usernameVariable: 'sshuser')]) {    
                    remote.user = sshuser
                    remote.identityFile = sshkey
                    sshPut remote: remote, from: 'build', into: '.'  
                    sshCommand remote: remote, command: "pwd"
                    
                    }
               
            }
        }
        
    }
}
