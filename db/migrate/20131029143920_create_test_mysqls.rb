class CreateTestMysqls < ActiveRecord::Migration
  def change
    create_table :test_mysqls do |t|
      t.text :content

      t.timestamps
    end
  end
end
