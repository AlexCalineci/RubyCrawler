json.array!(@test_mysqls) do |test_mysql|
  json.extract! test_mysql, :content
  json.url test_mysql_url(test_mysql, format: :json)
end