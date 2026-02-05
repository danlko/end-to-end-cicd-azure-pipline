# PyService on Azure (ACR + Azure DevOps + VM + Docker Compose)

Minimal DevOps project: Flask service + PostgreSQL running on Azure Linux VM via Docker Compose.  
The container image of the app is built and pushed to Azure Container Registry (ACR), and deployment is performed via Azure DevOps Pipeline over SSH.

## Tech

### Project Structure 
- app/                      # Flask application 
- terraform/                # Infrastructure as Code 
- tests/                    # pre-commit test and health-check
- Dockerfile                # App containerization
- docker-compose.yaml       # Infrastructure 
- docker-compose.prod.yaml  # Infrastructure for prod
- az-pipeline.yml           # CI/CD pipeline definition
- README.md

### Azure prereqs:

- Create ACR.
- Create VM (Ubuntu). Ports 5000 (app) 22 (SSH) in NSG have to be opened.
- Docker + Compose have to be installed.
- SSH access: public key added to ~/.ssh/authorized_keys on VM

Variables(env) must included:

ACR part:
- ACR_LOGIN_SERVER
- ACR_PASSWORD
- ACR_USERNAME

VirtualMachine part:
- VM_ADMIN_USER
- VM_PUBLIC_IP

DataBase part:
- DB_NAME
- DB_PASSWORD
- DB_USER

App part:
- APP_IMAGE

## Service available at: http://<VM_PUBLIC_IP>:5000/
