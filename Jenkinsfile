def remote = [:]
remote.name = "angular_testts"
remote.host = "3.91.5.117"
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
        
        stage('build') {
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
              script{
                withCredentials([sshUserPrivateKey(credentialsId: 'aws-credentialss', keyFileVariable: 'sshkey', passphraseVariable: '', usernameVariable: 'sshuser')]) {    
                    remote.user = sshuser
                    remote.identityFile = sshkey
                    
                    sshCommand remote: remote, command: "ls -la"
                    sshCommand remote: remote, command: "cd /home/ubuntu/brp-website-fe && pwd"
                    
                    }
              }  
            }
        }
    }
}
