cp mangodb.repo /etc/yum.repos.d/mangodb.repo  &>>/temp/roboshop.log

yum install mongodb-org -y  &>>/temp/roboshop.log

# update listen address from 127.0.0.1 to 0.0.0.0

systemctl enable mongod  &>>/temp/roboshop.log
systemctl restart mongod  &>>/temp/roboshop.log