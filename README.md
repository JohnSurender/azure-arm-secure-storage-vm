📘 Azure ARM Template — Secure Virtual Machine Deployment (Project 3)
This project demonstrates a secure, production‑ready virtual machine deployment using Azure Resource Manager (ARM) templates.
It includes networking, storage, security, identity, and VM configuration — all deployed as code.

This project showcases real IaC skills used in enterprise Azure environments.

🌍 Architecture Overview
This solution deploys:

A Virtual Machine (Ubuntu or Windows)

A Virtual Network + Subnet

A Network Security Group (NSG)

A Managed OS Disk

A Storage Account for boot diagnostics

A Private Endpoint for secure storage access

A System‑Assigned Managed Identity

A VM Extension (Custom Script)

Optional Key Vault for secrets

This architecture supports:

Secure VM provisioning

Private storage access

Identity‑based authentication

Automated configuration via extensions

Full infrastructure‑as‑code deployment

The full diagram is available in:
architecture/arm-vm-architecture.mmd

🏗 Components
1. Virtual Machine
Deployed via ARM template

Uses Managed OS Disk

Includes VM Extension for configuration

Uses Managed Identity for secure access

2. Networking
Virtual Network

Subnet

NSG with inbound rules

NIC attached to VM

3. Storage Account
Used for boot diagnostics

Accessed via Private Endpoint

Secured with network rules

4. Key Vault (Optional)
Stores secrets (e.g., admin password)

Accessed via Managed Identity

🚀 Deployment Steps
1. Deploy the ARM Template
bash
az deployment group create \
  --resource-group rg-arm-vm \
  --template-file main.json \
  --parameters parameters.json
2. Validate Deployment
bash
az deployment group validate \
  --resource-group rg-arm-vm \
  --template-file main.json \
  --parameters parameters.json
3. View Outputs
bash
az deployment group show \
  --resource-group rg-arm-vm \
  --name <deploymentName> \
  --query properties.outputs
🔐 Security Features
NSG restricts inbound traffic

Storage Account locked behind Private Endpoint

Managed Identity removes need for credentials

VM Extension executes secure configuration scripts

Key Vault stores secrets securely

No public access required

📄 Files in This Project
| File | Description |
| --- | --- |
| ``main.json`` | Main ARM template |
| ``parameters.json`` | Parameter values |
| ``scripts/configure-vm.sh`` | Custom script executed by VM extension |
| ``architecture/arm-vm-architecture.mmd`` | Architecture diagram |
| ``docs/overview.md`` | Full project documentation |

🎯 Learning Outcomes
By completing this project, you demonstrate:

ARM template authoring

Secure VM deployment

Private networking

Managed Identity usage

VM Extensions

Storage security

IaC best practices

🧩 Next Steps
Enhance this project by adding:

Azure Bastion

Key Vault private endpoint

Logging with Azure Monitor

Policy enforcement

Convert ARM → Bicep
