# Workshop Source Code

This folder contains the Terraform configuration and application source code for the Zero Trust Architecture lab.

## ⚠️ Important Note

For the complete, step-by-step lab guide (including Windows/PowerShell support, troubleshooting, and updated commands), please refer to the main **[README.md](../../README.md)** located in the root of this lab.

## Folder Structure

*   `network/`: Terraform for Networking Account (VPC Lattice, Route 53).
*   `frontend/`: Terraform for Frontend Account (ECS, ALB, Verified Access).
*   `backend/`: Terraform for Backend Account (ECS, Lambda, Lattice Services).
*   `applications/`: Source code for python applications (`portal`, `mservice1`, `mservice2`).
*   `modules/`: Shared Terraform modules.

## Configuration

Please use the `terraform.tfvars.example` files provided in each directory as a template from the main guide.