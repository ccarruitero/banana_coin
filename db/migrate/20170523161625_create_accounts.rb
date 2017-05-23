class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :address
      t.integer :balance

      t.timestamps
    end
  end
end
