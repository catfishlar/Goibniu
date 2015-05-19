json.array!(@schema_tables) do |schema_table|
  json.extract! schema_table, :id, :name, :schema_version_id
  json.url schema_table_url(schema_table, format: :json)
end
