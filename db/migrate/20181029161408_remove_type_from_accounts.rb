class RemoveTypeFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :limit, :float
    add_column :cards, :limit, :float
  end
end
