class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content

      t.timestamps null: false
    end
    add_index :posts, :created_at
  end
end
