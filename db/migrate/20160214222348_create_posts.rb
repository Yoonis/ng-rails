class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :link, null: false
      t.integer :upvotes

      t.timestamps null: false
    end
  end
end
