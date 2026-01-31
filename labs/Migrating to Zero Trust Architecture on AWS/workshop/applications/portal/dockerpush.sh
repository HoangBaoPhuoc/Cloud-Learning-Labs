#!/bin/bash

# Configuration - Update these values
AWS_REGION="ap-southeast-1"  # Your AWS Region
AWS_ACCOUNT_ID="123456789012"  # Replace with your Frontend Account ID
ECR_REPO_NAME="frontend"  # ECR repository name
AWS_PROFILE="frontend-account"  # AWS CLI SSO profile

# Login
echo "Logging in to ECR..."
aws ecr get-login-password --region ${AWS_REGION} --profile ${AWS_PROFILE} | \
  docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

# Build
echo "Building Docker image..."
docker build -t ${ECR_REPO_NAME} .

# Tag
echo "Tagging Docker image..."
docker tag ${ECR_REPO_NAME}:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest

# Push
echo "Pushing to ECR..."
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest

echo "Done!"