# 📘 Terraform Azure Linux VM – Multi-Environment Deployment
This repository contains a reusable Terraform configuration to provision a Linux Virtual Machine in Microsoft Azure across multiple environments such as:

🏢 DC (Data Center / Production)

🔁 DR (Disaster Recovery)

🧪 NON-PROD (Testing / Development)

The core Terraform code remains unchanged across environments.
Environment-specific values are managed using separate .tfvars files.

This approach ensures:

Clean Infrastructure as Code (IaC)

Environment consistency

Easy scalability

Centralized code management

Reduced duplication

🏗️ Architecture Components

This configuration provisions the following Azure resources:

Azure Resource Group

Virtual Network

Subnet

Public IP (Standard SKU)

Network Interface

Network Security Group (Dynamic Inbound Rules)

Linux Virtual Machine (Ubuntu 22.04 LTS)

Optional features:

Spot VM configuration (cost optimization)

Dynamic VM sizing via variables

Dynamic subnet CIDR allocation

Tag-based resource organization

🌍 Multi-Environment Strategy

The Terraform configuration is designed so that:

The main Terraform code remains static

Only the .tfvars file changes per environment
