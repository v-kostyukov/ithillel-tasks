### HW19. VPC Reserved IP
``` 
Перечислить все зарезервированные IP адреса в VPC и их назначение.
```
### Reserved IP
``` 	
The first four IP addresses and the last IP address in each subnet CIDR block are not available for you to use, and cannot be assigned to an instance. 
For example, in a subnet with CIDR block 10.0.0.0/24, the following five IP addresses are reserved:

10.0.0.0: Network address.

10.0.0.1: Reserved by AWS for the VPC router.

10.0.0.2: Reserved by AWS. The IP address of the DNS server is the base of the VPC network range plus two. 
For VPCs with multiple CIDR blocks, the IP address of the DNS server is located in the primary CIDR. 
We also reserve the base of each subnet range plus two for all CIDR blocks in the VPC. For more information, see Amazon DNS server.

10.0.0.3: Reserved by AWS for future use.

10.0.0.255: Network broadcast address. We do not support broadcast in a VPC, therefore we reserve this address.
```

