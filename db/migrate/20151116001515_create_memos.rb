class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.integer :user_id
      t.integer :document_id
      t.text :text

      t.timestamps null: false
    end
  end
end
