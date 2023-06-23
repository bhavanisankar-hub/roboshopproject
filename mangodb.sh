echo -e "\e[31mCopying Mangorepo\e[0m"
cp mangodb.repo /etc/yum.repos.d/mangodb.repo  &>>/tmp/roboshop.log

echo -e "\e[31mInstalling mangodb\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log

echo -e "\e[31mupdate listen address\e[0m"

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf


echo -e "\e[31mRestarting\e[0m"
systemctl enable mongod  &>>/tmp/roboshop.log
systemctl res  tart mongod  &>>/tmp/roboshop.log