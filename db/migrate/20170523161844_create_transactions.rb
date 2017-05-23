class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.text :description
      t.integer :amount
      t.string :instruction

      t.timestamps
    end
  end
end
