class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.integer :category_id
      t.string :entity
      t.boolean :expense
      t.decimal :value

      t.timestamps
    end
  end
end
