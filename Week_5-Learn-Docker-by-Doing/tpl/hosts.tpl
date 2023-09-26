[proxy]
bastion ansible_host=${bastion_public_ip}

[database]
database ansible_host=${database_private_ip}
