# This migration comes from blogger (originally 20160323160702)
class CreateBloggerComments < ActiveRecord::Migration
  def change
    create_table :blogger_comments do |t|
      t.integer :article_id
      t.text :text

      t.timestamps null: false
    end
  end
end
