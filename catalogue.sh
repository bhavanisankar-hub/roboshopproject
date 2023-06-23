echo -e "\e[31mConfiguring node js\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash  &>>/tmp/roboshoproject.log

echo -e "\e[31minstalling node js\e[0m"
yum install nodejs -y  &>>/tmp/roboshoproject.log

echo -e "\e[31madding application user\e[0m"
useradd roboshop  &>>/tmp/roboshoproject.log

mkdir /app  &>>/tmp/roboshoproject.log

echo -e "\e[31mdownloading catalogue\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip  &>>/tmp/roboshoproject.log

cd /app &>>/tmp/roboshoproject.log

echo -e "\e[31mextracting catalogue\e[0m"
unzip /tmp/catalogue.zip  &>>/tmp/roboshoproject.log

cd /app &>>/tmp/roboshoproject.log

echo -e "\e[31minstalling dependencies\e[0m"
npm install &>>/tmp/roboshoproject.log

echo -e "\e[31msetup service\e[0m"
cp /home/centos/roboshopproject/catalogue.service /etc/systemd/system/catalogue.service  &>>/tmp/roboshoproject.log

echo -e "\e[31mrestarting\e[0m"
systemctl daemon-reload  &>>/tmp/roboshoproject.log

systemctl enable catalogue  &>>/tmp/roboshoproject.log

systemctl start catalogue  &>>/tmp/roboshoproject.log

echo -e "\e[31mCopying Mangorepo\e[0m"
cp /home/centos/roboshopproject/mangodb.repo /etc/yum.repos.d/mangodb.repo  &>>/tmp/roboshoproject.log

echo -e "\e[31minstalling Mangorepo\e[0m"
yum install mongodb-org-shell -y  &>>/tmp/roboshoproject.log

echo -e "\e[31mloadschema\e[0m"
mongo --host mongodb-dev.devops89.site </app/schema/catalogue.js  &>>/tmp/roboshoproject.log
