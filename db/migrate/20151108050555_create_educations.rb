class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :key
      t.text :degree
      t.string :end_date

      t.timestamps null: false
    end
  end
end
