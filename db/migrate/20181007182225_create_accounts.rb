class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :client, index: true, foreign_key: true
      t.references :branch, index: true
      t.decimal :amount
      t.string :ac_type
      t.string :ac_number
      t.string :ifsc
      t.timestamps
    end
  end
end
