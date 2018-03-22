class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :bank_id
      t.integer :customer_id
      t.decimal :value

      t.timestamps
    end
  end
end
