class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :quantity
      t.text :rental_date
      t.text :return_date
      t.integer :cost_per_day
      t.string :conditions

      t.timestamps null: false
    end
  end
end
