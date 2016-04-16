class CreateTops < ActiveRecord::Migration[5.0]
  def change
    create_table :tops do |t|
      t.string :name
      t.string :category
      t.string :occupation
      t.string :age
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
