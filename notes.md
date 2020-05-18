
mkdir db_backup
cd db_backup

no data
    in terminal
        mysqldump -u user -p --no-data dbName > dumpFile.sql
with data
    in terminal
        mysqldump -u user -p dbName > dumpFile.sql
recreating
    in mysql
        create database dealership;
        use dealership;
    in terminal
    change to the backup db_backup directory
        mysql -u root dealership < dumpFile.sql



SELECT table_schema, table_name FROM INFORMATION_SCHEMA.tables WHERE table_schema = 'dealership';
