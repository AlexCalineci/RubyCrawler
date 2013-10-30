class CreateTestOracles < ActiveRecord::Migration
  def change
    create_table :test_oracles do |t|
      t.text :content

      t.timestamps
    end
  end
end
