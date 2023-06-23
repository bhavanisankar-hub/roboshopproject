echo -e "\e[31mCopying Mangorepo\e[0m"
cp mangodb.repo /etc/yum.repos.d/mangodb.repo  &>>/tmp/roboshop.log

echo -e "\e[31mInstalling mangodb\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log

# update listen address from 127.0.0.1 to 0.0.0.0

echo -e "\e[31mRestarting\e[0m"
systemctl enable mongod  &>>/tmp/roboshop.log
systemctl restart mongod  &>>/tmp/roboshop.log