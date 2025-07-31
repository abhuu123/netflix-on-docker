# Netflix Clone – Deploy with Docker on AWS EC2

This project demonstrates how to deploy a **static Netflix Clone website** (HTML/CSS) using Docker on an AWS EC2 instance.

## Prerequisites

- **AWS EC2 instance**
  - OS: Ubuntu
  - Type: t2.medium (or higher recommended)
- **Security Group Rules**
  - Allow inbound:
    - Port **22** (SSH)
    - Port **80** (HTTP)
    - Port **4100** (Custom web app port)
  - For testing purposes, you can allow all traffic (0.0.0.0/0) temporarily.

---

## Step 1: Install Docker

SSH into your EC2 instance and run:

   - sudo apt update
   - sudo apt install docker.io -y


Verify Docker installation:

   - docker --version

---

## Step 2: Install Git

Install Git on the EC2 instance:

   - sudo apt-get update
   - sudo apt-get install git -y

Verify Git installation:

   - git --version

---

## Step 3: Clone the Repository

Navigate to your home directory and clone the repository:

   - cd /home/ubuntu
   - git clone https://github.com/abhuu123/netflix-on-docker.git

---

## Step 4: Build Docker Image

Move into the cloned repository:

   - cd netflix-on-docker

Build the Docker image (don’t forget the `.` at the end):

   - sudo docker build -t netflix-clone .

List Docker images to confirm:

   - sudo docker images

---

## Step 5: Run Docker Container

Run the container in detached mode, binding **port 4100** on the host to **port 80** inside the container:

   - sudo docker run -d -p 4100:80 netflix-clone
   
---

## Step 6: Access the Web App

Open a browser and visit:

   - http://<your-ec2-public-ip>:4100

You will see the Netflix Clone static website served from Docker.

---


## Demonstrating Docker Power: Delete Code, Container Keeps Running!

One of the biggest advantages of Docker is **isolation**.  
Even if you delete your project files from the EC2 instance, your container will still run because it has its own copy of the files baked into the image.

---

### Step 1: Verify Container is Running

  - sudo docker ps

You will see a container running (STATUS should be "Up").

---

### Step 2: Delete All Files in the Cloned Folder

  - cd /home/ubuntu
  - sudo rm -rf netflix-on-docker

Confirm that the project folder is gone:

   - ls


---

### Step 3: Check the Website

Open your browser again:

   - http://<your-ec2-public-ip>:4100


You will **still see your Netflix Clone running!**

This is because the container runs independently of the source code on your EC2 instance. The files are already packaged inside the image.

---

### Step 4: Stop and Remove the Container (Optional)

To stop the running container:

  - sudo docker ps
  - sudo docker stop <container_id>

If you want to remove unused containers and images:

   - sudo docker system prune -a
   
---

## Key Takeaway

**Once a Docker container is built and running, your application doesn’t depend on your source files anymore.
The app continues to run even if the files are deleted from the server.**
    
  
  
   
