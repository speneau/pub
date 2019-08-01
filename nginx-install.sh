#!/bin/bash 
sudo apt-get -y update 
sudo apt-get -y install nginx 
sudo mkdir -p /var/www/web.sebpno.ga/html  
sudo chown -R $USER:$USER /var/www/web.sebpno.ga/html 
sudo chmod -R 755 /var/www/web.sebpno.ga 
echo "<html>\n<title>Welcome to web.sebpno.ga!</title>\n<body>\n<h2>Welcome to Azure! My name is $(hostname).</h2>\n</body>\n</html>" | sudo tee -a /var/www/web.sebpno.ga/html/index.html  
echo "server {\nlisten 80;\nlisten [::]:80;\nroot /var/www/web.sebpno.ga/html;\nindex index.html index.htm index.nginx-debian.html;\nserver_name web.sebpno.ga;\nlocation /\n{ try_files \$uri \$uri/ =404;\n}\n}" | sudo tee -a /etc/nginx/sites-available/web.sebpno.ga
sudo ln -s /etc/nginx/sites-available/web.sebpno.ga /etc/nginx/sites-enabled/
sudo systemctl restart nginx
