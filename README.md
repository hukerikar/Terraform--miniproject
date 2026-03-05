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

# ⚠️ Difficulties Faced

While building this project, a few practical challenges were encountered due to limitations of the **Azure Free Subscription**.

### 1️⃣ VM Size Availability Limitations
Many Linux VM sizes were **not available under the Azure free subscription**.  
Because of this, several VM sizes had to be tested before finding one that could actually be deployed.

### 2️⃣ Regional Restrictions
Some VM sizes that were available in Azure were **not supported in certain regions**.  
This required multiple attempts by changing:

- VM size
- Azure region
- Deployment configuration

before successfully provisioning the infrastructure.

### 3️⃣ Trial and Error During Deployment
Due to the above restrictions, the deployment process required **multiple back-and-forth iterations** including:

- Updating `.tfvars` files
- Changing VM sizes
- Switching Azure regions
- Re-running Terraform deployments

This experience helped in better understanding how **Azure resource availability varies across regions and subscription tiers**.

Despite these challenges, the final Terraform configuration was designed to remain **environment-independent**, requiring only `.tfvars` changes to deploy across multiple environments.
