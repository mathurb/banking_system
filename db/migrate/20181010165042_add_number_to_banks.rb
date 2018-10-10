class AddNumberToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :number, :string
  end
end
