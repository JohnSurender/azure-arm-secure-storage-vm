#!/bin/bash

echo "Starting ARM template deployment..."

RESOURCE_GROUP="rg-arm-vm"
LOCATION="uksouth"

# Create Resource Group
az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION

echo "Resource Group created."

# Deploy ARM Template
az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file main.json \
  --parameters @parameters.json

echo "Deployment completed successfully."

# Show outputs
az deployment group show \
  --resource-group $RESOURCE_GROUP \
  --name $(az deployment group list --resource-group $RESOURCE_GROUP --query "[0].name" -o tsv) \
  --query properties.outputs
