CREATE DATABASE IF NOT EXISTS mydatabase;
GRANT ALL ON mydatabase.* TO 'myuser'@'%' IDENTIFIED BY 'mypassword';
FLUSH PRIVILEGES;