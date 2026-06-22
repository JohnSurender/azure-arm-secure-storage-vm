📄 Project Documentation — ARM Template Secure VM Deployment
1. Overview
This project deploys a secure virtual machine architecture using Azure Resource Manager (ARM) templates.
It demonstrates real‑world Infrastructure‑as‑Code (IaC) practices including networking, identity, storage, and VM configuration.

The deployment includes:

Virtual Machine

Virtual Network + Subnet

Network Security Group

Managed Identity

Storage Account (boot diagnostics)

Private Endpoint

VM Extension (custom script)

This architecture reflects modern Azure security and automation standards.

2. Architecture Summary
The solution includes:

Virtual Network with a dedicated subnet

Network Security Group with inbound SSH rule

NIC attached to the VM

Managed OS Disk

Storage Account for diagnostics

Private Endpoint for secure storage access

System‑Assigned Managed Identity

Custom Script Extension for VM configuration

The full diagram is available in:
architecture/arm-vm-architecture.mmd

3. Deployment Flow
Resource Group is created

ARM template deploys networking (VNet, Subnet, NSG)

NIC is created and attached to the subnet

Storage Account is deployed

VM is created with:

Managed Identity

Managed Disk

Boot diagnostics enabled

Private Endpoint connects VM subnet to Storage Account

VM Extension runs configure-vm.sh to install Apache

4. Security Considerations
NSG restricts inbound traffic to SSH only

Storage Account is accessed privately via Private Endpoint

Managed Identity removes the need for credentials

VM Extension runs securely inside the VM

No public IP is required for the VM (optional)

Boot diagnostics stored in a secure Storage Account

This architecture follows Azure security best practices.

5. Cost Estimation (Approx.)

   | Component | Quantity | Estimated Monthly Cost |
| --- | --- | --- |
| VM (B1s) | 1 | ~£10–£12 |
| Managed Disk | 1 | ~£3–£4 |
| Storage Account | 1 | ~£2–£3 |
| VNet + Subnet | 1 | Free |
| Private Endpoint | 1 | ~£5–£7 |

Estimated total: ~£20–£25 per month
(Varies by region and VM size)

7. Troubleshooting
VM not reachable
Ensure NSG allows SSH (22)

Confirm VM has a public IP (if required)

Check NIC is attached to correct subnet

Storage access failing
Verify Private Endpoint is approved

Ensure subnet has correct DNS resolution

Check Storage firewall settings

VM Extension failed
Check /var/log/azure/custom-script/handler.log

Ensure script has correct permissions

Validate package installation commands

Deployment errors
Run validation:
az deployment group validate

Check parameter names

Ensure resource names are globally unique (storage)

7. Future Enhancements
Add Azure Bastion for secure SSH

Add Key Vault private endpoint

Add monitoring with Azure Monitor

Convert ARM → Bicep

Add Policy enforcement

Add VMSS for scaling
