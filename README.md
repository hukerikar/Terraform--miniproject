# 📘 Terraform Azure Linux VM – Multi-Environment Deployment

This repository contains a reusable Terraform configuration to provision a **Linux Virtual Machine in Microsoft Azure** across multiple environments.

## 🌍 Environments

- 🏢 **DC** — Data Center / Production  
- 🔁 **DR** — Disaster Recovery  
- 🧪 **NON-PROD** — Testing / Development  

The **Terraform code remains unchanged across environments**.  
Only the **`.tfvars` files are modified** to deploy infrastructure in different environments.

This approach provides:

- Clean **Infrastructure as Code (IaC)**
- Environment consistency
- Easy scalability
- Centralized code management
- Reduced duplication

---

# 🏗️ Architecture Components

The Terraform configuration provisions the following Azure resources:

- Azure **Resource Group**
- **Virtual Network**
- **Subnet**
- **Public IP** (Standard SKU)
- **Network Interface**
- **Network Security Group** with dynamic inbound rules
- **Linux Virtual Machine** (Ubuntu 22.04 LTS)

### Optional Features

- Spot VM configuration *(cost optimization)*
- Dynamic VM sizing through variables
- Dynamic subnet CIDR allocation
- Tag-based resource organization

---

# 🌍 Multi-Environment Strategy

The Terraform configuration is designed so that:

- The **main Terraform code never changes**
- Only the **`.tfvars` file changes per environment**

Example environment files:

```
dc.tfvars
dr.tfvars
nonprod.tfvars
```

Each environment file defines:

- Environment name
- Azure region
- Network configuration
- VM size
- Disk size
- Resource tags

---

# 🚀 Deployment

## 1️⃣ Initialize Terraform

```bash
terraform init
```

## 2️⃣ Validate Configuration

```bash
terraform validate
```

## 3️⃣ Deploy Infrastructure

Deploy to **DC environment**

```bash
terraform apply -var-file="dc.tfvars"
```

Deploy to **DR environment**

```bash
terraform apply -var-file="dr.tfvars"
```

Deploy to **Non-Production environment**

```bash
terraform apply -var-file="nonprod.tfvars"
```

---

# ⚙️ Technologies Used

- Terraform
- Microsoft Azure
- Ubuntu 22.04 LTS
- Azure Networking
- Azure Spot Virtual Machines

---

# 📌 Key Highlights

✔ Reusable Terraform code across environments  
✔ Environment-based configuration using `.tfvars`  
✔ Cost optimization using **Azure Spot VMs**  
✔ Dynamic **Network Security Group rules**  
✔ Flexible **VM sizing and networking**

---

# 👨‍💻 Author

Cloud Infrastructure Project demonstrating scalable Azure infrastructure using **Terraform and Microsoft Azure**.
