#ignite
# cat /users/Ignite/.ssh/ams.pub >> /users/Ignite/.ssh/authorized_keys;		 
# chmod 0600 /users/Ignite/.ssh/ams*; 
# chmod 0600 /users/Ignite/.ssh/authorized_keys; 		 
# rm -rf /users/Ignite/.ssh/known_hosts;  
# echo 'StrictHostKeyChecking no' >> /users/Ignite/.ssh/config

#root
cp /users/Ignite/.ssh/* ~/.ssh/
cat ~/.ssh/ams.pub >> ~/.ssh/authorized_keys;
rm ~/.ssh/id_rsa*
mv ~/.ssh/ams.pub ~/.ssh/id_rsa.pub
mv ~/.ssh/ams ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa*;
chmod 0600 ~/.ssh/authorized_keys; 
rm -rf ~/.ssh/known_hosts;
echo 'StrictHostKeyChecking no' > ~/.ssh/config
