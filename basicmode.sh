#!/bin/bash

for ((i=0;i<10;i++))
do
  user="user$i"
  sudo adduser $user
  sudo mkdir "/home/$user/delta"
  sudo chmod -R 707 "/home/$user"
done
sudo groupadd root
sudo groupadd admins
sudo groupadd moderators
sudo groupadd students
sudo usermod -a -G root user0
sudo chgrp -R root "/home/user0"
sudo chown -R user0 "/home/user0"
for ((i=1;i<=3;i++))
do
  useradmins="user$i"
  usermoderators="user$(expr $i + 3)"
  userstudents="user$(expr $i + 6)"
  sudo usermod -a -G admins,root $useradmins
  sudo chgrp -R admins "/home/$useradmins"
  sudo chown -R $useradmins "/home/$useradmins"
  sudo usermod -a -G moderators,root,admins $usermoderators
  sudo chgrp -R moderators "/home/$usermoderators"
  sudo chown -R $usermoderators "/home/$usermoderators"
  sudo usermod -a -G students,root,admins,moderators $userstudents
  sudo chgrp -R students "/home/$userstudents"
  sudo chown -R $userstudents "/home/$userstudents"
done


