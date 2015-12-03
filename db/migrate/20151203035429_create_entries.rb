class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.text :body
      t.integer :category_id
      t.string :title
      t.string :author
      t.string :conference
      t.integer :publish_year

      t.timestamps null: false
    end
  end
end
