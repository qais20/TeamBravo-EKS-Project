# 2048 Deployment by Team Bravo EKS 🚀 ![Build Passing](https://img.shields.io/badge/build-passing-brightgreen)

### This project is a deployment of the classic 2048 game hosted using AWS EKS by Team Bravo.👥🤝

This app is a straightforward yet engaging game where players combine numbered tiles to achieve the elusive 2048 tile through careful planning and strategic movements. 🎮🕹️🧩

## Project Description 📄

![GIF](https://media.giphy.com/media/jOzq6q92RYEGoJnoV3/giphy.gif)

This project was undertaken to deploy the 2048 game as a cloud-native application using Amazon EKS (Elastic Kubernetes Service). The primary goal was to demonstrate the scalability, resilience, and efficiency of modern cloud platforms in hosting containerised applications. By leveraging cloud services, we showcased the ability to manage and deploy applications seamlessly in a distributed environment, focusing on performance, reliability, and ease of management.

## Table Of Contents  📑
- [Tech Stack ](#tech-stack)
- [Local App Set Up ](#local-app-set-up)
- [Contributors ](#contributors)
- [License ](#license)

## Tech Stack 🛠️

![Python Version](https://img.shields.io/badge/python-3.11-green)



### DevOps Tools 🔧

#### These are the tools we used to set up the infrastructure, automate deployments, and manage the applications's lifecycle:

| Tool                       | Description                                                                  |
|----------------------------|------------------------------------------------------------------------------|
| 🛠️ **Terraform**            | Infrastructure as Code (IaC) tool for provisioning and managing cloud resources. |
| 📦 **Amazon ECR**           | A fully managed Docker container registry to store and manage images.         |
| ☁️ **Amazon EKS**           | Managed Kubernetes service to deploy and manage containerised applications.    |
| 🐳 **Docker**               | Platform to automate the deployment of applications in containers.            |
| 🧰 **Kubernetes**           | Open-source system for automating the deployment, scaling, and management of containerised applications. |
| 🔄 **CI/CD**                | Continuous Integration and Continuous Deployment pipelines for automation.    |
| 🚀 **ArgoCD**               | GitOps continuous delivery tool for Kubernetes, automating deployments and managing the lifecycle of applications. |
| 🛡️ **Trivy**                | Vulnerability scanner for containers and other artefacts, ensuring security. |
##
## Local App Set Up 🖥️

```
python -m http.server 3000
```

```
http://localhost:3000/
```
## Contributors 👥

| Contributor | Role                    |
|-------------|-------------------------|
| Qais  Navaei      | Contributor, DevOps Engineer |
| Abdel Yusuf      | Contributor, DevOps Engineer |
| Najib Mahmoud      | Contributor, DevOps Engineer |
| Aaliyana Adoley Mingle    | Contributor, DevOps Engineer |


## License 📝

Please refer to the app's official owner license [here](./LICENSE.txt).
