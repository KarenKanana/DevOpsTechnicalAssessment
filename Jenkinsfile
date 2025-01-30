pipeline {
    agent any
    environment {
        IMAGE_NAME = 'my-app'
        GCP_PROJECT_ID = 'my-app-449417' 
        GCP_REGION = 'us-central1'  
        GCP_REPO_NAME = 'my-app-repo'  
    }
    stages {
        stage('Authenticate to Google Cloud') {
            steps {
                withCredentials([file(credentialsId: 'gcp-service-account', variable: 'GCP_KEY')]) {
                    sh "gcloud auth activate-service-account --key-file=${GCP_KEY}"
                    sh "gcloud auth configure-docker ${GCP_REGION}-docker.pkg.dev --quiet"  
                }
            }
        }
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'git@github.com:KarenKanana/DevOpsTechnicalAssessment.git', credentialsId: 'github-ssh-key' 
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t gcr.io/${GCP_PROJECT_ID}/${GCP_REPO_NAME}:${BUILD_NUMBER} .'  
            }
        }
        stage('Push Image to Artifact Registry') {
            steps {
                sh 'docker push gcr.io/${GCP_PROJECT_ID}/${GCP_REPO_NAME}:${BUILD_NUMBER}'  
            }
        }
        
    }
}
