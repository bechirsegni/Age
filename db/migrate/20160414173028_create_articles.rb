class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.boolean :published, default: false
      t.integer :category_id
      t.timestamps
    end
  end
end
