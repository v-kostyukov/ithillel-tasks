### HW40. Terraform for Azure
``` 
Write TF scripts which creates:
1. Resource group
2. 2 VNets
3. 2 subnets (One subnet per VNet)
4. 1 security group
    - Allow 22 port
5. Configure Perring between VNets
6. VM1:
    - VNet 1
    - Subnet 1
    - Public IP: yes
    - DNS "A" record in a private DNS zone
7. VM2:
    - VNet 2
    - Subnet 2
    - Public IP: no
    - DNS "A" record in a private DNS zone
8. Private DNS zone
9. Associate DNS zone with both VNets

The main goal:

1. Created VMs must be allocated in different VNets but, they must be accessible to each other by 22 port
2. One of the VM must have public IP
3. Each VM must be resolvable.
```



