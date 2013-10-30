class CreateTestPostgresqls < ActiveRecord::Migration
  def change
    create_table :test_postgresqls do |t|
      t.text :content

      t.timestamps
    end
  end
end
