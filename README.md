Goibniu
=======

manage data on a database for anonymization analysis and qa testing.

I started playing with this idea in 2012.  Sat dormant for a while. 

Started as an idea for playing with Scala Play.  Eventually I came back 
to this for a anonymization project and did it in rails.   My first Rails app.
Its pretty ugly but it helped me with my task. 

Putting this in public to see if my pride will make me clean it up. 

There are some other projects that I want to add to that I need to clean up a bit.

System Dependencies
-------------------

This is a  pretty simple rails app.  

Configuration
-------------

The SQL lite default has been fine for me so far.  


Database Creation
-----------------

This database was created using rails generate scaffold.

This is available in the repo as generate_tables.sh in the project root.

    #!/bin/sh
    rails generate scaffold TableStatus  db_status_id:integer name:string engine:string version:string row_format:string rows:integer avg_row_length:integer data_length:integer max_data_length:integer index_length:integer data_free:integer auto_increment:string create_time:datetime update_time:datetime check_time:datetime collation:string checksum:string create_options:string comment:string

    rails generate scaffold Schema name:string
    rails generate scaffold SchemaVersion schema_id:integer version:string mysql_dump:string mysql_distrib:string comment:string
    rails generate scaffold SchemaTable schema_version_id:integer name:string
    rails generate scaffold SchemaField schema_table_id:integer name:string type:string type_param:string nullable:boolean default:string
    rails generate scaffold SchemaKey schema_table_id:integer name:string primary:boolean unique:boolean
    rails generate scaffold SchemaKeyField schema_key_id:integer name:string order:integer

How To Run The Test Suite
-------------------------

This is the kind of section that I want to be public so that I fix the
testing situation with this app.  There is a lot of scoffolded files that
were not filled in in the test directory. 

I did do testing in my rbetl project.  Test first even. 

Services
--------

Eventually there should be some scheduled table status loaders.  Maybe some 
schema change detectors.

Deployment Instructions
-----------------------

Pretty straight forward rails app. 