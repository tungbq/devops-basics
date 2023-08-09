#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd.service
systemctl start httpd.service
# Create the HTML file
touch /var/www/html/index.html

cat > /var/www/html/index.html <<EOF
<h1>Hello, World! My name is Tung</h1>
<p>DB address: TO-BE-ADDED</p>
<p>Hostname: $(hostname -f)</p>
<p>Date: $(date)</p>
EOF
