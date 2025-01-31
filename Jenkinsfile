pipeline {
    agent any
    environment {
        REGION = "us-central1"
        IMAGE_NAME = 'my-app'
        GCP_PROJECT_ID = 'my-app-449417' 
        GCP_REGION = 'us-central1'  
        DOCKER_REPO = 'my-app-repo'
        ARTIFACT_REGISTRY = "us-central1-docker.pkg.dev/${GCP_PROJECT_ID}/${DOCKER_REPO}"
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_URI = "${ARTIFACT_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
        SERVICE_NAME = 'my-app'
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
                sh 'docker build -t ${IMAGE_NAME}:latest .'  
            }
        }
        stage('Push Image to Artifact Registry') {
            steps {
                sh """
                    echo "IMAGE_NAME: $IMAGE_NAME"
                    echo "DOCKER_REPO: $DOCKER_REPO"
                    echo "BUILD_NUMBER: $BUILD_NUMBER"
                    docker tag ${IMAGE_NAME}:latest ${IMAGE_URI} // Tag with full URI
                    docker push ${IMAGE_URI} 
                """
            }
        }
        stage('Deploy to Cloud Run') {
            steps {
                script {
                    sh """
                    gcloud run deploy ${SERVICE_NAME} \
                        --image=${IMAGE_URI} \
                        --platform=managed \
                        --region=${REGION} \
                        --allow-unauthenticated
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Deployment successful! 🚀"
            sh "gcloud run services describe ${SERVICE_NAME} --region=${REGION} --format='value(status.url)'"
        }
        failure {
            echo "Deployment failed! ❌ Check logs for errors."
        }
    }
}
        


