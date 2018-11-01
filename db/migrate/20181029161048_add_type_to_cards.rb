class AddTypeToCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :limit, :decimal
    add_column :accounts, :limit, :float
  end
end
