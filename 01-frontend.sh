echo -e "\e[31mInstalling nginx server\e[0m"
yum install nginx -y  &>>/tmp/roboshopproject.log


echo -e "\e[31mRemoving old content\e[0m"
rm -rf /usr/share/nginx/html/*  &>>/tmp/roboshoproject.log

echo -e "\e[31mDownloading Frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip  &>>/tmp/roboshopproject.log

echo -e "\e[31mExtracting frontend content\e[0m"
cd /usr/share/nginx/html  &>>/tmp/roboshopproject.log
unzip /tmp/frontend.zip  &>>/tmp/roboshopproject.log

echo -e "\e[31mupdate frontend configuraion\e[0m"
cp /home/centos/roboshopproject/roboshop.conf /etc/nginx/default.d/roboshop.conf

echo -e "\e[31mstarting nginx server\e[0m"
systemctl enable nginx  &>>/tmp/roboshopproject.log
systemctl restart nginx  &>>/tmp/roboshopproject.log