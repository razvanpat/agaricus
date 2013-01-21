class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :category_id
      t.integer :month
      t.integer :year
      t.decimal :value

      t.timestamps
    end
  end
end
