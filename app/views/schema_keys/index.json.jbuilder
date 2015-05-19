json.array!(@schema_keys) do |schema_key|
  json.extract! schema_key, :id, :schema_table_id, :name, :primary, :unique
  json.url schema_key_url(schema_key, format: :json)
end
