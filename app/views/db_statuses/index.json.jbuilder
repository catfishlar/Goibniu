json.array!(@db_statuses) do |db_status|
  json.extract! db_status, :id, :database_id, :request_date, :note
  json.url db_status_url(db_status, format: :json)
end
