-- Create a master key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'password';

-- Create a database scoped credential
CREATE DATABASE SCOPED CREDENTIAL MongoCredential
WITH IDENTITY = 'username',
SECRET = 'password';

-- Create an external data source
CREATE EXTERNAL DATA SOURCE MongoDataSource
WITH (
    LOCATION = 'mongodb://username:password@mongo-server:27017',
    CREDENTIAL = MongoCredential,
    TYPE = HADOOP
);

-- Create an external file format
CREATE EXTERNAL FILE FORMAT MongoFormat
WITH (
    FORMAT_TYPE = BSON,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.GzipCodec'
);

-- Create an external table
CREATE EXTERNAL TABLE dbo.MongoTable (
    _id NVARCHAR(24),
    user_id NVARCHAR(30),
    age INT,
    status CHAR(1)
)
WITH (
    LOCATION='/database.collection/',
    DATA_SOURCE=MongoDataSource,
    FILE_FORMAT=MongoFormat
);

-- Query the external table
SELECT * FROM dbo.MongoTable;
