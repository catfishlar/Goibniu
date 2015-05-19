#!/bin/sh
#rails generate scaffold TableStatus  db_status_id:integer name:string engine:string version:string row_format:string rows:integer avg_row_length:integer data_length:integer max_data_length:integer index_length:integer data_free:integer auto_increment:string create_time:datetime update_time:datetime check_time:datetime collation:string checksum:string create_options:string comment:string

rails generate scaffold Schema name:string
rails generate scaffold SchemaVersion schema_id:integer version:string mysql_dump:string mysql_distrib:string comment:string
rails generate scaffold SchemaTable schema_version_id:integer name:string
rails generate scaffold SchemaField schema_table_id:integer name:string type:string type_param:string nullable:boolean default:string
rails generate scaffold SchemaKey schema_table_id:integer name:string primary:boolean unique:boolean
rails generate scaffold SchemaKeyField schema_key_id:integer name:string order:integer
