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
                sh "docker image prune -f -a"

            }
        }
    
        stage('Build Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            image = docker.build("78afec35/onecleverhorse")
                        }
                    }
                }
            }
        stage('Tag Images'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
                                image.push("${env.app_version}")
                            }
                        }
                    }    
                }
            }
        stage('Push Image'){
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