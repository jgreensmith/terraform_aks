#!/bin/bash

# Enable "exit on error" mode: the script will immediately terminate if any command exits with a non-zero status.
set -e

# Retrieve Azure credentials from 1Password CLI
# echo "Fetching Azure credentials from 1Password..."
# AZURE_CLIENT_ID=$(op read op://Private/azure_sp/client_id)
# AZURE_CLIENT_SECRET=$(op read op://Private/azure_sp/client_secret)
# AZURE_TENANT_ID=$(op read op://Private/azure_sp/tenant_id)
# AZURE_SUBSCRIPTION_ID=$(op read op://Private/azure_sp/subscription_id)

# # Export Azure credentials as environment variables
# export ARM_CLIENT_ID=$AZURE_CLIENT_ID
# export ARM_CLIENT_SECRET=$AZURE_CLIENT_SECRET
# export ARM_TENANT_ID=$AZURE_TENANT_ID
# export ARM_SUBSCRIPTION_ID=$AZURE_SUBSCRIPTION_ID


# Build and push Docker image
IMAGE_NAME="weenie-image:latest"
ACR_LOGIN_SERVER="thecontainerregistry.azurecr.io"
echo "Building Docker image..."
sudo docker build -t $ACR_LOGIN_SERVER/$IMAGE_NAME .

echo "Pushing Docker image to ACR..."
sudo docker push $ACR_LOGIN_SERVER/$IMAGE_NAME
echo "Docker image pushed successfully!"

# Run Terraform commands
# echo "Initializing Terraform..."
# terraform init

# echo "Applying Terraform configuration..."
# terraform apply -auto-approve

# echo "Deployment complete!"
