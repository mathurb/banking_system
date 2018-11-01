class AddAmountToAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :amount, :decimal
    add_column :accounts, :amount, :string
  end
end
