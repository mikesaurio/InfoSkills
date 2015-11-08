class ChangeColumnInfo < ActiveRecord::Migration
  def up
    change_column :companies, :key, :text
    change_column :educations, :key, :text
    change_column :skills, :key, :text
  end

  def down
    change_column :companies, :key, :integer
    change_column :educations, :key, :integer
    change_column :skills, :key, :integer
  end
end
