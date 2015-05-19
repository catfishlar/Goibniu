json.array!(@schema_versions) do |schema_version|
  json.extract! schema_version, :id, :schema_id, :version, :mysql_dump, :mysql_distrib, :comment
  json.url schema_version_url(schema_version, format: :json)
end
