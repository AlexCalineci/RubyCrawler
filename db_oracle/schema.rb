# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131030134342) do

# Could not dump table "bonuses" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "countries" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "departments" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "emp" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "empi" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "employees" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "job_history" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "jobs" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "locations" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "new_employees" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "regions" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "t1" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "test_mysqls" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "test_oracles" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

# Could not dump table "test_postgresqls" because of following NoMethodError
#   undefined method `column_spec_with_oracle_enhanced' for #<ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter:0xa90f650>

  add_foreign_key "countries", "regions", primary_key: nil, name: "countr_reg_fk"

  add_foreign_key "departments", "employees", column: "manager_id", primary_key: nil, name: "dept_mgr_fk"
  add_foreign_key "departments", "locations", primary_key: nil, name: "dept_loc_fk"

  add_foreign_key "employees", "departments", primary_key: nil, name: "emp_dept_fk"
  add_foreign_key "employees", "employees", column: "manager_id", primary_key: nil, name: "emp_manager_fk"
  add_foreign_key "employees", "jobs", primary_key: nil, name: "emp_job_fk"

  add_foreign_key "job_history", "departments", primary_key: nil, name: "jhist_dept_fk"
  add_foreign_key "job_history", "employees", primary_key: nil, name: "jhist_emp_fk"
  add_foreign_key "job_history", "jobs", primary_key: nil, name: "jhist_job_fk"

  add_foreign_key "locations", "countries", primary_key: nil, name: "loc_c_id_fk"

end
