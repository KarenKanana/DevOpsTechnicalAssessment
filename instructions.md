# DevOps Technical Assessment

## Task 1: Version Control Integration (15%)
### Objective
Create a Git repository for a sample project. Include the following:
- A simple web application
- Commits with clear and descriptive messages
- Push the repository to a remote Git server

### Evaluation Criteria
- Secure system integration.
- Proper repository setup
- Meaningful commit history
- Successful push to a remote repository

## Task 2: Containerization with Docker (15%)
### Objective
Containerize the web application from Task 1. The Docker container should:
- Expose the necessary ports
- Include all dependencies
- Be able to run the web application

### Evaluation Criteria
- Dockerfile correctness
- Successful build and run of the Docker container
- Web application accessible within the container

### Bonus Sub-task
- Use Docker Compose to simulate a multi-container environment for local development (e.g. application + database)

## Task 3: Infrastructure as Code (IaC) (DevOps and Cloud Engineering) (20%)
### Objective
Use an IaC tool of your choice (Terraform, Pulumi, CloudFormation, Bicep, or OpenTofu) to define and deploy the following cloud resources:
- Virtual machine instance
- Networking components (e.g., Vnet/VPC, subnets)
- Appropriate security configurations (Allow HTTP/HTTPS traffic)
- Static IP address for the VM

### Evaluation Criteria
- Correct IaC script
- Successful resource deployment
- Proper handling of dependencies

## Task 4: CI/CD Pipeline with Cloud Integration (DevOps and Cloud Engineering) (25%)
### Objective
Create a CI/CD pipeline using a tool of your choice (Jenkins, GitHub Actions, GitLab CI, CircleCI, etc). The pipeline should:
- Build and tag the container.
- Package and push the image of the container to a container image repository (e.g., Dockerhub, AWS ECR, GCP Artifact Registry, Azure Container Registry)
- Deploy the application to a cloud-based environment (i.e., the VM created in Task 3/AWS ECS/Google Cloud Run/Kubernetes)

### Evaluation Criteria
- Successful pipeline creation
- Proper handling of environment variables
- Proper integration with cloud resources
- Successful deployment to the cloud-based environment

### Bonus Sub-task
- Provide a pipeline diagram explaining each stage.
- Automating the provisioning of your infrastructure in a CI/CD pipeline as well.

## Task 5: Site Reliability Engineering (SRE) (25%)
### Objective
Implement basic SRE principles by monitoring and ensuring the reliability of the deployed web application. Include:
- Setup monitoring tools (e.g., Prometheus, Grafana)
- Configure alerts for critical metrics
- Implement basic incident response procedures

### Evaluation Criteria
- Proper setup and configuration of monitoring tools
- Effective implementation of alerting mechanisms
- Demonstrated understanding of incident response procedures

## Bonus Task: Ansible Configuration Management
### Objective
Write an Ansible playbook that configures the Virtual Machine provisioned in Task 3 with the following:
- Copies a file (e.g., a sample config.txt) from the local machine to the server’s `/opt/` directory with read/write access to users in the devops group only
- Installs the latest version of PostgreSQL
- Ensures the PostgreSQL service is enabled and running
- Installs and configures a web server (e.g., Nginx or Apache)

### Evaluation Criteria
- Successful and secure VM configuration
- Proper SSH access for non-root user
- Proper file permission and ownership setup
- Proper use of Ansible for configuration management
