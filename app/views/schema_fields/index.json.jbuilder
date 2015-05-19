json.array!(@schema_fields) do |schema_field|
  json.extract! schema_field, :id, :schema_table_id, :name, :field_type, :type_params, :nullable, :default
  json.url schema_field_url(schema_field, format: :json)
end
