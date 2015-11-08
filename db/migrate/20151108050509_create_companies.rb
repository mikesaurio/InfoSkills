class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :key
      t.text :company
      t.text :title
      t.string :end_date

      t.timestamps null: false
    end
  end
end
