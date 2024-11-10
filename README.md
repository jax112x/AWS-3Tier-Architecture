# AWS 3 Tier VPC Architecture

## Overview
The 3 Tier VPC (Virtual Private Cloud) architecture on AWS is a design pattern that divides an application into three tiers within a VPC. This architecture provides increased scalability, availability, and security by distributing the components of the application across multiple availability zones.

## Architecture
![alt text](/architecture.svg "Architecture")

## Technologies used
AWS VPC, Terraform

## VPC Structure

In this architecture we divide the VPC into Web Tier, Application Tier and Database Tier.

- **Web Tier** - Public layer for hosting the front-end/user-facing components of the application.
- **Application Tier** - Private layer for hosting back-end components.
- **Database Tier**- Private layer for hosting the application’s database.

## Implementation Details

### VPC
The VPC uses a CIDR block of 10.16.0.0/16.

### Subnets
Each subnet uses a /20 mask giving us a total of 16 subnets. Each tier is deployed in two different availability zones. Only 6 subnets will be in use. Rest will be reserved for future use.

### Internet Gateway
An Internet Gateway is created to give internet access to the public subnets.

### NAT Gateway
Two NAT gateways are created in each public subnet. These nat gateways will handle any internet requests from the private subnets. Each nat gateway gets its own elastic ip address.

### Route Tables
- A route table pointing to the internet gateway is created. This table is associated with the public subnets.
- In each availability zone, a route table pointing to the NAT gateway in that availability zone is created. Each of the tables is associated with private subnets from that availability zone respectively.


