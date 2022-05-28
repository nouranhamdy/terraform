#!/bin/sh
cd /var/jenkins_home/workspace/test-terraform/
cat terraform/key-pair.pem > ~/.ssh/mykey.pem
chmod 400 ~/.ssh/mykey.pem
#cd terraform/
#bastion_ip=`terraform output -json bastion-ip | tr -d '"'`
#private_ip=`terraform output -json private-ip | tr -d '"'`
#export private_ip
cat << EOF > ~/.ssh/config
Host *
    Port 22
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    ServerAliveInterval 60
    ServerAliveCountMax 30

host bastion
   HostName ${bastion_ip}
   User ubuntu
   identityFile ~/.ssh/mykey.pem

host private_instance
   HostName  ${private_ip}
   user  ubuntu
   ProxyCommand ssh bastion -W %h:%p
   identityFile ~/.ssh/mykey.pem
EOF


cat << EOF > ansible-slave/inventory
[slaves]
server-a ansible_host=${private_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/mykey.pem
[slaves:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand="ssh -W %h:%p -q bastion"'
EOF