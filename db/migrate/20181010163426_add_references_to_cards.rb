class AddReferencesToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :bank
  end
end
