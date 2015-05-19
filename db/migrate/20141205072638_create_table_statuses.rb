class CreateTableStatuses < ActiveRecord::Migration
  def change
    create_table :table_statuses do |t|
      t.integer :db_status_id
      t.string :name
      t.string :engine
      t.string :version
      t.string :row_format
      t.integer :rows
      t.integer :avg_row_length
      t.integer :data_length
      t.integer :max_data_length
      t.integer :index_length
      t.integer :data_free
      t.string :auto_increment
      t.datetime :create_time
      t.datetime :update_time
      t.datetime :check_time
      t.string :collation
      t.string :checksum
      t.string :create_options
      t.string :comment

      t.timestamps
    end
  end
end
