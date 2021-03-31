pipeline{
    agent any
    environment {
            app_version = ":$BUILD_NUMBER"
            rollback = 'false'
        }
    stages{
        stage('Clean and Download'){
            steps{
                sh "sudo docker-compose down"
                sh "sudo docker image prune -f -a"
                sh "rm -rf OneCleverHorse/"
                sh "git clone https://github.com/78afec35/OneCleverHorse"
            }
        }
    

        stage('Set Up Environment'){
            steps{
                sh "sudo sh ./startupscript.sh"

            }
        }
    
        stage('Build Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            image = docker.build("[your-dockerhub-username]/chaperoo-frontend")
                        }
                    }
                }
            }
        
        
        stage('Naming Stack and Building') { 
            steps { 
                script { 
                    dockerImage = docker-compose.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        
        stage('Test'){
            steps{
                sh "sudo docker-compose pull && docker-compose up -d"
            }
        } 

        

        stage('Clean up'){
            steps{
                sh "sudo docker-compose down"
                sh "sudo docker image prune -f -a"
            }
        }
                
    }
}