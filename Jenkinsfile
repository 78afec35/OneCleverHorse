pipeline{
    environment {
        registry = "78afec35/onecleverhorse"
        registryCredential = '78afec35' 
        dockerImage = '' 
    }
    agent any
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
    
        // stage('Build'){
        //     steps{
        //         sh "sudo docker-compose build"
        //     }
        // }
        
        
        
        stage('Naming Stack and Building') { 
            steps { 
                script { 
                    dockerImage = docker-compose.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        
        stage('Test'){
            steps{
                sh "sudo docker-compose up -d"
            }
        }

        stage('Pushing image') { 
            steps { 
                sh "sudo docker push"
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