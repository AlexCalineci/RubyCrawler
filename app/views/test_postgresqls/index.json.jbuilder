json.array!(@test_postgresqls) do |test_postgresql|
  json.extract! test_postgresql, :content
  json.url test_postgresql_url(test_postgresql, format: :json)
end