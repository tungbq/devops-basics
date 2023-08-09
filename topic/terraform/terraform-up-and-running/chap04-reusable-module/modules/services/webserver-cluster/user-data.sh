#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd.service
systemctl start httpd.service
# Create the HTML file
touch /var/www/html/index.html

cat > /var/www/html/index.html <<EOF
<h1>Hello, World! My name is Tung</h1>
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
EOF
