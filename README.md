# Matlab_Database_connection

This is an example of how to create a connection from Matlab to a given database by JDBC (in our case, MySQL).

![demo2](/images/matlab_database.gif?raw=true)

## Usage

For this example:
1. Download the attached jar (*/jars/mysql-connector-java-5.1.43-bin.jar*) and copy it to a fixed location (in our example, *C:\jars*)
2. In the code, modify the following lines
```matlab
dbname = 'name_of_your_database';
username = 'username_of_your_database';
password = 'password_of_your_database';
driver = 'com.mysql.jdbc.Driver';
dburl = ['jdbc:mysql://127.0.0.1:3306/' dbname];  %If needed, you can change the 127.0.0.1 to a different address and port.
javaclasspath('C:\jars\mysql-connector-java-5.1.43-bin.jar'); %Place the path of the jar.
```
The lines above are self explanatory, but in case a more detailed description is needed, we have the following:
1. **dbname**: This is the database name you are trying to establish the connection to. In MySQL, these are known as **Schemas**.
2. **username** and **password**: These are the username and password used to connect to the schema.
3. **driver**: To connect to MySQL, keep the value of 
```
com.mysql.jdbc.Driver
```
If you want to use a different database, please consult [here](https://www.mathworks.com/help/database/ug/database.html?requestedDomain=www.mathworks.com). As an example, for Microsoft SQL, you can use
```
com.microsoft.sqlserver.jdbc.SQLServerDriver
```
4. **dburl**: To connect to MySQL, keep the value of 
```
['jdbc:mysql://127.0.0.1:3306/' dbname];
```
If you want to use a different database, please consult [here](https://www.mathworks.com/help/database/ug/database.html?requestedDomain=www.mathworks.com). As an example, for Microsoft SQL, you can use
```
jdbc:sqlserver://localhost:port;database=databasename
```

## How to execute queries

A connection link has to be defined.
```matlab
conn = database(dbname, username, password, driver, dburl);
```

### Server date

If you want to obtain the server's time, run the following query
```matlab
query1 = 'select now()'
curs = exec(conn,query1);
curs = fetch(curs);
DatabaseTimestamp = curs.Data
```

### Stored procedures

There are two ways to run a stored procedure from Matlab. If you want to check the status of the stored procedure, just run
```matlab
query2 = 'call your_stored_procedure_name(input1, input2, input3, input4)'
curs = exec(conn,query2);
curs = fetch(curs);
result = curs.Data
```
where *result* holds the stauts of executing the procedure.