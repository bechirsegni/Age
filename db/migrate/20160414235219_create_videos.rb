class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
