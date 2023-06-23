cp mangodb.repo /etc/yum.repos.d/mangodb.repo  &>>/tmp/roboshop.log

yum install mongodb-org -y  &>>/tmp/roboshop.log

# update listen address from 127.0.0.1 to 0.0.0.0

systemctl enable mongod  &>>/tmp/roboshop.log
systemctl restart mongod  &>>/tmp/roboshop.log