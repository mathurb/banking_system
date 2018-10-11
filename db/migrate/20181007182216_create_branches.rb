class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.references :bank, index: true, foreign_key: true
      t.string :address
      t.string :ifsc
      t.string :number
      t.timestamps
    end
  end
end
