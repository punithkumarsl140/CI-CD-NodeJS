# 🚀 Node.js CI/CD Pipeline with GitHub Actions and Docker

This project demonstrates a complete CI/CD pipeline setup using **GitHub Actions**, **Docker**, and **Docker Hub** to automate the build and deployment process of a simple Node.js web application.

---

## 📦 Tech Stack

- **Node.js** – Web application runtime
- **Docker** – Containerization tool
- **GitHub Actions** – CI/CD automation
- **Docker Hub** – Container registry

---

## 🎯 Objective

- Automate the build, test (optional), and deployment of a Node.js app
- Containerize the app using Docker
- Push the built Docker image to Docker Hub on every push to the `main` branch

---

### File Descriptions:

1. **`.github/workflows/main.yml`**  
   - Defines the CI/CD pipeline using GitHub Actions
   - Automates testing, building, and Docker image deployment
   - Triggers on pushes to the `main` branch

2. **`Dockerfile`**  
   - Contains instructions for building the application Docker image
   - Uses Node.js 14 Alpine base image for small footprint
   - Sets up working directory, installs dependencies, and runs the app

3. **`.dockerignore`**  
   - Excludes unnecessary files from Docker builds (node_modules, logs)
   - Reduces image size and build time

4. **`app.js`**  
   - Main application file using Express.js
   - Simple web server listening on port 3000
   - Returns "Hello from CI/CD Pipeline!" on root route

5. **`package.json`**  
   - Defines project metadata and dependencies
   - Contains scripts for running the application
   - Lists required npm packages (express)

6. **`README.md`**  
   - Project documentation and setup instructions
   - Includes this project structure overview
   - Explains the CI/CD workflow


---

## 🔧 GitHub Actions Workflow (main.yml)

```yaml
on:
  push:
    branches:
      - main

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Set up Docker
        uses: docker/setup-buildx-action@v3

      - name: Log in to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build Docker Image
        run: docker build -t slsrikanthkumar/nodejs-ci-cd:latest

     - name: Push to Docker Hub
        run: docker push slsrikanthkumar/nodejs-ci-cd:lat
