class CreateTransection < ActiveRecord::Migration[5.2]
  def change
    create_table :transections do |t|
      t.references :account, index: true, foreign_key: true
      t.string :txn_type
      t.decimal :amount
      t.timestamps
    end
  end
end
