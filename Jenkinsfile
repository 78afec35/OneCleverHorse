pipeline{
    agent any
    environment {
            DATABASE_URI = credentials("DATABASE_URI")
            SECRET_KEY = credentials("SECRET_KEY")
            rollback = 'false'
        }
    stages{
        stage('Clean and Download'){
            steps{
                sh "sudo rm -rf OneCleverHorse/"
                sh "git clone https://github.com/78afec35/OneCleverHorse"
            }
        }
    

        stage('Set Up Environment'){
            steps{
                sh "sudo sh ./startupscript.sh"
                sh "docker image prune -f -a"
                sh "docker rmi -f -a"
                sh "docker rm $(docker ps -a -f -q)"
                sh "docker ps"
                sh "pwd"

            }
        }
    
        stage('Run tests'){
            steps{
                sh "sudo sh ./tests.sh"
                sh "pwd"

            }
        }
    
        stage('Build Image'){
                steps{
                  sh "docker-compose build" 
                  sh "pwd" 
                }
            }
        
        stage('Push Image'){
                steps{
                    sh "docker-compose push" 
                    sh "pwd" 
                }
            }
        stage('Test Deploy'){
            steps{
                sh "docker-compose up -d"
                sh "pwd"
            }
        } 
        stage('Clean up'){
            steps{
                sh "docker-compose down"
                sh "docker image prune -f -a"
                sh "pwd"
            }
        }
        stage('Ansible Config'){
            steps{
                sh "cd ansible && /home/jenkins/.local/bin/ansible-playbook -i inventory.yaml playbook.yaml"
            }
        }
        stage('Stack Deploy'){
            steps{
                sh "sudo sh ./stack_run.sh"
            }
        }
                
    }
}