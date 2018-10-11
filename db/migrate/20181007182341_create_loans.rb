class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.references :client, index: true, foreign_key: true
      t.string :loan_type
      t.decimal :amount
      t.timestamps
    end
  end
end
