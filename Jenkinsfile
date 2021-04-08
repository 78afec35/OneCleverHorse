pipeline{
    agent any
    environment {
            app_version = "$BUILD_NUMBER"
            rollback = 'false'
        }
    stages{
        stage('Clean and Download'){
            steps{
                sh "rm -rf OneCleverHorse/"
                sh "git clone https://github.com/78afec35/OneCleverHorse"
            }
        }
    

        stage('Set Up Environment'){
            steps{
                sh "sudo sh ./startupscript.sh"
                sh "docker image prune -f -a"

            }
        }
    
        stage('Run tests'){
            steps{
                sh "sudo sh ./tests.sh"

            }
        }
    
        stage('Build Image'){
                steps{
                  sh "docker-compose build"  
                }
            }
        
        stage('Push Image'){
                steps{
                    sh "docker-compose push"  
                }
            }
        stage('Test Deploy'){
            steps{
                sh "docker-compose up -d"
            }
        } 
        stage('Clean up'){
            steps{
                sh "docker-compose down"
                sh "docker image prune -f -a"
            }
        }
        stage('Ansible Config'){
            steps{
                sh "pwd"
            }
        }
        stage('Stack Deploy'){
            steps{
                sh "pwd"
            }
        }
                
    }
}