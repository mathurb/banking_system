class AddReferencesToLoans < ActiveRecord::Migration[5.2]
  def change
    add_reference :loans, :branch
  end
end
