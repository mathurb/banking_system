class RemoveTypeFromLoans < ActiveRecord::Migration[5.2]
  def change
# amount type change in accounts
    remove_column :accounts, :amount, :string
    add_column :accounts, :amount, :float
# amount type change in loan
    remove_column :loans, :amount, :decimal
    add_column :loans, :amount, :float
# amount type change in transection
    remove_column :transections, :amount, :decimal
    add_column :transections, :amount, :float
  end
end
