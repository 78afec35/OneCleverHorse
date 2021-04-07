pipeline{
    agent any
    environment {
            app_version = ":$BUILD_NUMBER"
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

            }
        }
    
        stage('Build Image'){
                steps{

                    sh "docker image prune -f -a"
                    sh "docker-compose build"
                
                }
            }
        
        stage('Tag & Push Image'){
                steps{
                
                        
                sh "docker-compose push" 
                            
                }
            }
        stage('Test'){
            steps{
                sh "docker-compose pull && sudo docker-compose up -d"
            }
        } 

        

        stage('Clean up'){
            steps{
                sh "docker-compose down"
                sh "docker image prune -f -a"
            }
        }
                
    }
}

// Test Edit