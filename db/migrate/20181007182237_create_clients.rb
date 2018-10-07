class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.references :branch, index: true, foreign_key: true
      t.string :number
      t.integer :age
      t.string :name
 t.timestamps
    end
  end
end
