clear;
clc;

dbname = 'name_of_your_database';
username = 'username_of_your_database';
password = 'password_of_your_database';
driver = 'com.mysql.jdbc.Driver';
dburl = ['jdbc:mysql://127.0.0.1:3306/' dbname];  %If needed, you can change the 127.0.0.1 to a different address and port.
javaclasspath('C:\jars\mysql-connector-java-5.1.43-bin.jar'); %Place the path of the jar.

conn = database(dbname, username, password, driver, dburl);

query1 = 'select now()'
curs = exec(conn,query1);
curs = fetch(curs);
DatabaseTimestamp = curs.Data

query2 = 'call your_stored_procedure_name(input1, input2, input3, input4)'
curs = exec(conn,query2);
curs = fetch(curs);
result = curs.Data

%This is an example of how to call a stored procedure without output.
query3 = 'call your_stored_procedure_name(input1, input2, input3, input4)';
curs = exec(conn,query3);


%Remember to close your connection at the end.
close(conn);

