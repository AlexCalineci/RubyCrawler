class TestOracle < ActiveRecord::Base
  databases = YAML::load(IO.read('config/database_oracle.yml'))
  establish_connection(databases[Rails.env])
end
