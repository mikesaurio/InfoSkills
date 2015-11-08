class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :key
      t.text :name

      t.timestamps null: false
    end
  end
end
