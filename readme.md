Dockerfile:

openssl req: This is the OpenSSL command for generating a new certificate signing request (CSR) and a new private key. It is followed by several options to configure the certificate.

-newkey rsa:4096: This option specifies that a new RSA key pair with a key length of 4096 bits should be generated.

-x509: This option tells OpenSSL to create a self-signed certificate rather than a certificate signing request (CSR).

-sha256: This option specifies the signature hash algorithm to use, in this case, SHA-256.

-days 365: This option sets the validity period of the certificate to 365 days.

-nodes: This option tells OpenSSL not to encrypt the private key with a passphrase. The private key will be generated without a passphrase, which is common for server certificates.

-out /etc/nginx/ssl/pdelannoy.crt: This specifies the path where the generated self-signed certificate (.crt file) will be saved.

-keyout /etc/nginx/ssl/pdelannoy.key: This specifies the path where the generated private key (.key file) will be saved.


nginx.conf:

listen 443 ssl; and listen [::]:443 ssl;: These lines specify that the server block should listen on port 443 for both IPv4 and IPv6 connections. Port 443 is the standard HTTPS port, and the ssl keyword indicates that SSL (Secure Sockets Layer) is used for encrypted connections.

server_name inception;: This line specifies that this server block should be used for requests with the "inception" server name.

SSL Configuration:

ssl_certificate /etc/nginx/ssl/raccoman.pem;: This line specifies the path to the SSL certificate file.
ssl_certificate_key /etc/nginx/ssl/raccoman.key;: This line specifies the path to the SSL certificate's private key file.
ssl_protocols TLSv1.2 TLSv1.3;: This line specifies the allowed SSL/TLS protocols. In this case, it allows TLS versions 1.2 and 1.3, which are more secure than older versions.
Document Root and Index:

root /var/www/html;: This line sets the document root directory where the website files are located.
index index.php index.html index.htm;: These lines specify the order in which index files should be looked for when a directory is accessed. In this case, it looks for "index.php" first, followed by "index.html" and "index.htm."
Location Blocks:

location / { ... }: This block handles requests to the root directory ("/"). It enables autoindexing (directory listing), and if the requested file or directory doesn't exist, it returns a 404 error.
location ~ \.php$ { ... }: This block is used for handling PHP files. It sets up the FastCGI process for PHP and specifies the location of the PHP-FPM server, along with various FastCGI parameters.
