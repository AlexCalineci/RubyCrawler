# lib/tasks/databases.rake
 
# Public: This Rake file tries to add what rails provides on the
# databases.rake but for building on top of custom databases.
# Basically we get the nice db:migrate but for using it on a different DB than
# the default, by calling it with the namespace defined here.
#
# In order to be able to use the default rails rake commands but on a different
# DB, we are first updating the Rails.application.config.paths and then
# calling the original rake task. Rails.application.config.paths is getting
# loaded and available as soon as we call rake since the rakefile in a rails
# project declares that. Look at Rakefile in the project root for more details.
 
 
# Public: Access to the same commands you do for DB operations,
# like db:drop, db:migrate but using the store namespace, this will
# execute on top of the store DB.
namespace :postgresql do
 
  desc "Configure the variables that rails need in order to look up for the db
    configuration in a different folder"
  task :set_custom_db_config_paths do
    # This is the minimum required to tell rails to use a different location
    # for all the files related to the database.
    ENV['SCHEMA'] = 'db_postgresql/schema.rb'
    Rails.application.config.paths['db'] = ['db_postgresql']
    Rails.application.config.paths['db/migrate'] = ['db_postgresql/migrate']
    Rails.application.config.paths['db/seeds'] = ['db_postgresql/seeds.rb']
    Rails.application.config.paths['config/database'] = ['config/database_postgresql.yml']
  end
 
  namespace :db do
    task :drop => :set_custom_db_config_paths do
      Rake::Task["db:drop"].invoke
    end
 
    task :create => :set_custom_db_config_paths do
      Rake::Task["db:create"].invoke
    end
 
    task :migrate => :set_custom_db_config_paths do
      Rake::Task["db:migrate"].invoke
    end
 
    task :rollback => :set_custom_db_config_paths do
      Rake::Task["db:rollback"].invoke
    end
 
    task :seed => :set_custom_db_config_paths do
      Rake::Task["db:seed"].invoke
    end
 
    task :version => :set_custom_db_config_paths do
      Rake::Task["db:version"].invoke
    end
  end
end


namespace :oracle do
 
  desc "Configure the variables that rails need in order to look up for the db
    configuration in a different folder"
  task :set_custom_db_config_paths do
    # This is the minimum required to tell rails to use a different location
    # for all the files related to the database.
    ENV['SCHEMA'] = 'db_oracle/schema.rb'
    Rails.application.config.paths['db'] = ['db_oracle']
    Rails.application.config.paths['db/migrate'] = ['db_oracle/migrate']
    Rails.application.config.paths['db/seeds'] = ['db_oracle/seeds.rb']
    Rails.application.config.paths['config/database'] = ['config/database_oracle.yml']
  end
 
  namespace :db do
    task :drop => :set_custom_db_config_paths do
      Rake::Task["db:drop"].invoke
    end
 
    task :create => :set_custom_db_config_paths do
      Rake::Task["db:create"].invoke
    end
 
    task :migrate => :set_custom_db_config_paths do
      Rake::Task["db:migrate"].invoke
    end
 
    task :rollback => :set_custom_db_config_paths do
      Rake::Task["db:rollback"].invoke
    end
 
    task :seed => :set_custom_db_config_paths do
      Rake::Task["db:seed"].invoke
    end
 
    task :version => :set_custom_db_config_paths do
      Rake::Task["db:version"].invoke
    end
  end
end
