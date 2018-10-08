class CreateCards < ActiveRecord::Migration[5.2]
 def change
  create_table :cards do |t|
   t.references :account, index: true, foreign_key: true   
   t.string :card_type
   t.string :number
   t.integer :pin
   t.decimal :limit
   t.timestamps
  end
 end
end
