class AddForeignKeyToTools < ActiveRecord::Migration
  def change
    add_column :tools, :customer_id, :integer
  end
end
