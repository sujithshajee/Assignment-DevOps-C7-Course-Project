#!/bin/bash
ssh -i /tmp/terraform-key.pem ubuntu@10.50.3.196 docker stop app-server && docker rm app-server
ssh -i /tmp/terraform-key.pem ubuntu@10.50.3.196 docker run -p 8080:8081 --name app-server 280661052493.dkr.ecr.us-east-1.amazonaws.com/app/app:latest 
