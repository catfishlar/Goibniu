json.array!(@table_statuses) do |table_status|
  json.extract! table_status, :id, :db_status_id, :name, :engine, :version, :row_format, :rows, :avg_row_length, :data_length, :max_data_length, :index_length, :data_free, :auto_increment, :create_time, :update_time, :check_time, :collation, :checksum, :create_options, :comment
  json.url table_status_url(table_status, format: :json)
end
