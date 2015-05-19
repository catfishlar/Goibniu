json.array!(@schema_key_fields) do |schema_key_field|
  json.extract! schema_key_field, :id, :schema_key_id, :name, :order
  json.url schema_key_field_url(schema_key_field, format: :json)
end
