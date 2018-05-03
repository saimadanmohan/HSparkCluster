cat ~/.ssh/ams.pub >> ~/.ssh/authorized_keys;		 
chmod 0600 ~/.ssh/ams*; 
chmod 0600 ~/.ssh/authorized_keys; 		 
rm -rf ~/.ssh/known_hosts;  
echo 'StrictHostKeyChecking no' >> ~/.ssh/config
