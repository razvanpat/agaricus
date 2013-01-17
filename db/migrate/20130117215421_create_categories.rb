class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.decimal :balance

      t.timestamps
    end
  end
end
