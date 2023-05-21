# HighavailabilityMongoDbSqlserver
There is no direct way to achieve high availability between SQL Server and MongoDB, but you can use some techniques to synchronize data between them.
One possible approach is to use the Command Query Responsibility Segregation (CQRS) pattern, which involves having two databases: one for writing and one for reading.
You can use SQL Server as your write database and MongoDB as your read database. You can then use a tool like ncqrs1 or SQL Server Integration Services (SSIS) to transfer data from SQL Server to MongoDB periodically. 
Another possible approach is to use Polybase, a feature of SQL Server 2019 that allows you to create a data virtualization layer across multiple data sources, including MongoDB.
You can then query MongoDB data from SQL Server using T-SQL statements. Here is some sample code for creating an external table in SQL Server that references a MongoDB collection
