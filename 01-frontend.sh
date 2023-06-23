echo -e "\e[31mInstalling nginx server\e[0m"
yum install nginx -y


echo -e "\e[31mRemoving old content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[31mDownloading Frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[31mExtracting frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#copy the configuration file

echo -e "\e[31mstarting nginx server\e[0m"
systemctl enable nginx
systemctl restart nginx