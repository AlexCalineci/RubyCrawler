json.array!(@test_oracles) do |test_oracle|
  json.extract! test_oracle, :content
  json.url test_oracle_url(test_oracle, format: :json)
end