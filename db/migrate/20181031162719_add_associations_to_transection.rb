class AddAssociationsToTransection < ActiveRecord::Migration[5.2]
  def change
    add_reference :transections, :card
  end
end
