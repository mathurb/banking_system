class RemoveNumberFromBanks < ActiveRecord::Migration[5.2]
  def change
    remove_column :banks, :number, :integer
  end
end
