CREATE DATABASE IF NOT EXISTS `mpp_test_datawarehouse`;
GRANT ALL ON `mpp_test_datawarehouse`.* TO 'root'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;