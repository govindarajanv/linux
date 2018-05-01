yum install open_ssl mod_ssl -y
openssl genrsa -out $(hostname -f).key 2048
