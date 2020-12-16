# Backend of Gewaechshaus project

## Set DB

For CentOS:  
`grep 'temporary password' /var/log/mysqld.log`

For all:  
`sudo mysql_secure_installation`


```
create database gewaechshaus;
GRANT ALL PRIVILEGES ON gewaechshaus.* TO 'gewaechshaus'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
```

Reset password in CentOS:  

```
# systemctl stop mysqld
# systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
# systemctl start mysqld
# mysql -u root
mysql> UPDATE mysql.user SET authentication_string = PASSWORD('password') WHERE User = 'root' AND Host = 'localhost';
mysql> FLUSH PRIVILEGES;
mysql> quit
# systemctl stop mysqld
# systemctl unset-environment MYSQLD_OPTS
# systemctl start mysqld
```

From Elementary OS:

`sudo mysql -u root -p`

# API request for add measure

```
{
  "measured_at": 1608151508,
  "sensor_id": 1,
  "isActive": true,
  "value": 7
}
```
