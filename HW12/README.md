### HW12. AWS Services
``` 
Перечислить все Global сервисы AWS.
Привести пример 10 Region bound сервисов AWS.
Привести пример 10 VPC bound сервисов AWS.
```
### Global сервисы AWS
```
IAM - The same AWS accounts, users, groups and roles can be used across all regions

CloudFront - Per AWS: Amazon CloudFront employs a global network of edge locations and regional edge caches that cache 
copies of your content close to your viewers. Amazon CloudFront ensures that end-user requests are served by the closest edge location.

Route53 - Per AWS: Using a global anycast network of DNS servers around the world, 
Route 53 is designed to automatically answer queries from the optimal location depending on network conditions. 
As a result, the service offers low query latency for your end users.  

S3 (Namespace) - S3 Namespace is global; all bucket names must be globally unique.

Security Token Service (STS) - By default, AWS STS is a global service with a single endpoint at https://sts.amazonaws.com. 
However, you can also choose to make AWS STS API calls to endpoints in any other supported region. 
This can reduce latency (server lag) by sending the requests to servers in a region that is geographically closer to you. 
No matter which region your credentials come from, they work globally.

WAF - Per AWS: AWS WAF is tightly integrated with Amazon CloudFront and the Application Load Balancer (ALB), services that AWS
customers commonly use to deliver content for their websites and applications. When you use AWS WAF on Amazon CloudFront, 
your rules run in all AWS Edge Locations, located around the world close to your end users. This means security doesn’t 
come at the expense of performance. Blocked requests are stopped before they reach your web servers. 
When you use AWS WAF on Application Load Balancer, your rules run in region and can be used to protect internet-facing 
as well as internal load balancers.
```
### Region bound сервисы AWS
```
EC2
Resource Identifiers – Regional
Each resource identifier, such as an AMI ID, instance ID, EBS volume ID, or EBS snapshot ID, is tied to its region 
and can be used only in the region where you created the resource. 

DynamoDb – Regional
All data objects are stored within the same region and replicated across multiple Availability Zones in the same region
Data objects can be explicitly replicated across regions using cross-region replication

Storage Gateway – Regional
AWS Storage Gateway stores volume, snapshot, and tape data in the AWS region in which the gateway is activated

Virtual Private Cloud
VPC – Regional
VPC are created within a region

Amazon Elastic Block Store

Amazon File Storage

Elastic Load Balancing

Amazon RDS 

Lambda

Lightsail
```
### VPC bound сервисы AWS
```
VPC network services include:
IPv4 and IPv6 address blocks
Subnet creation
Route tables
Internet connectivity
DHCP Options Sets
Elastic IP addresses (EIPs)
Network/subnet security
Endpoints
Endpoints Services
NAT Gateways

Additional networking services:
Virtual Private Networks (VPNs)
Direct connectivity between VPCs (VPC peering)
Amazon API Gateway
Gateways
Mirror sessions
```
