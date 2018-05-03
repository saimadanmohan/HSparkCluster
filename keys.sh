cat /users/Ignite/.ssh/ams.pub >> /users/Ignite/.ssh/authorized_keys;		 
chmod 0600 /users/Ignite/.ssh/ams*; 
chmod 0600 /users/Ignite/.ssh/authorized_keys; 		 
rm -rf /users/Ignite/.ssh/known_hosts;  
echo 'StrictHostKeyChecking no' >> /users/Ignite/.ssh/config
