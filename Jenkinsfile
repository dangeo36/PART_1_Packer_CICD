pipeline {
    agent any
    environment {
                AWS_ACCESS_KEY_ID = credentials('aws-creds')
                AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
            }
    stages {
        stage ('Packer init') {
            steps {
                    echo 'initializing packer'
                    sh 'packer init aws-amazon-linux-2-ami.pkr.hcl'
            }  
        }
        stage ('Packer fmt') {
            steps {
                script {
                    echo 'formatting packer code'
                    sh 'packer fmt aws-amazon-linux-2-ami.pkr.hcl'
                }
            }  
        }
        stage ('Packer validate') {
            steps {
                script {
                    echo 'validating packer code'
                    sh 'packer validate aws-amazon-linux-2-ami.pkr.hcl'
                }
            }  
        }
        stage ('packer build ami') {
            steps {
                    echo 'building ami'
                    sh 'packer build aws-amazon-linux-2-ami.pkr.hcl'
            }  
        }
        
    }
}
