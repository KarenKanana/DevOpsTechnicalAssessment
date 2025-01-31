# DevOpsTechnicalAssessment
This repository contains a simple web application built with HTML, CSS, and JavaScript. The project demonstrates a complete DevOps pipeline using Jenkins for CI/CD and GCP for deploying the containerized web application to Cloud Run.

## Overview

This project was developed as part of a DevOps technical assessment, covering:

- Version Control Integration: Using Git and GitHub for repository management.

- Containerization: Packaging the web application with Docker.

- Infrastructure as Code (IaC): Provisioning cloud resources using Terraform.

- CI/CD Pipeline: Automating builds and deployments with Jenkins.

- Site Reliability Engineering (SRE): Implementing monitoring, logging, and alerting mechanisms.


## Prerequisites

- Google Cloud SDK installed and configured
- Terraform installed
- Jenkins running on a VM on Google Cloud Platform (GCP)
- Docker installed
- GitHub account

## Setup Instructions
### 1. Clone the Repository

```
git clone git@github.com:KarenKanana/DevOpsTechnicalAssessment.git
cd DevOpsTechnicalAssessment
```

### 2. Authenticate with Google Cloud
Open a terminal and authenticate with your Google Cloud account:

`gcloud auth login`

Then set the project:

`gcloud config set project YOUR_GCP_PROJECT_ID`

### 3. Deploy Infrastructure with Terraform
Navigate to the directory containing the Terraform scripts and initialize Terraform:

`terraform init`

Apply the Terraform configuration to create required resources.

`terraform apply`

Review the plan, then confirm the changes to deploy resources. 
### 4. Set Up Jenkins and Jenkins Pipeline
> **Disclaimer:** In this project, Jenkins was set up on a VM in Google Cloud Platform (GCP). However, Jenkins can also be hosted on-premises, on another cloud provider (AWS, Azure), or run as a container in Kubernetes.

Ensure Jenkins is properly set up on a VM in your GCP environment. This involves:
- Creating a VM on GCP (configured with required resources and open ports).
- Installing Jenkins on the VM.
- Connect Jenkins to GitHub using SSH keys for authentication.
- Install necessary plugins (e.g., Git, Docker, Google Cloud SDK).
- Setting up Jenkins credentials to access Google Cloud and Docker registry.

The Jenkinsfile is configured to:
- Build and tag the Docker image for the web application.
- Push the image to the GCP Artifact Registry.
- Deploy the containerized application to Cloud Run.

You can trigger the pipeline manually from the Jenkins dashboard or push code to GitHub, which will automatically trigger the pipeline via webhook.


### 5. Monitor and Verify the Deployment
Once the pipeline completes, verify the deployment on Google Cloud Run:

- Visit the URL provided by Cloud Run to view the web application running live.
- Ensure the application is working as expected, and the containerized services are up and running.

#### Metrics and Monitoring
Cloud Monitoring and Cloud Logging have been set up to monitor the deployed web application. Alerts are configured for critical metrics such as:
- CPU usage
- Memory usage
- Container restarts

This setup ensures the application is running smoothly and any issues are detected early.

### Troubleshooting

#### Common Issues and Solutions
- Authentication Issues: Ensure your Google Cloud credentials are correctly configured (`gcloud auth login`).
- Terraform Apply Errors: Run `terraform validate` before terraform apply to check for misconfigurations.
- Jenkins Pipeline Failing: Check logs in Jenkins and ensure credentials for GitHub and Google Cloud are correctly set.
- Deployment Not Visible: Verify Cloud Run service URL and ensure the application is responding.


### Conclusion
This project showcases how to:

- Set up a web application using Git, Docker, and Terraform.
- Build a Jenkins CI/CD pipeline for automating deployments to Google Cloud Run.
- Ensure continuous monitoring and incident response with Google Cloud Monitoring.

Feel free to clone the repository and explore the implementation. Contributions are welcome!

