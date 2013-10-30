class TestPostgresql < ActiveRecord::Base
  #self.abstract_class = true
 
  databases = YAML::load(IO.read('config/database_postgresql.yml'))
  establish_connection(databases[Rails.env])
end
