# Matlab_Database_connection

This is an example of how to create a connection from Matlab to a given database by JDBC (in our case, MySQL).

![demo2](/images/matlab_database.gif?raw=true)

## Usage

For this example:
1. Download the attached jar (*/jars/mysql-connector-java-5.1.43-bin.jar*) and copy it to a fixed location (in our example, *C:\jars*)
2. In the code, modify the following lines
``` matlab
dbname = 'name_of_your_database';
username = 'username_of_your_database';
password = 'password_of_your_database';
driver = 'com.mysql.jdbc.Driver';
dburl = ['jdbc:mysql://127.0.0.1:3306/' dbname];  %If needed, you can change the 127.0.0.1 to a different address and port.
javaclasspath('C:\jars\mysql-connector-java-5.1.43-bin.jar'); %Place the path of the jar.
```



