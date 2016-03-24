# This migration comes from blogger (originally 20160323020036)
class CreateBloggerArticles < ActiveRecord::Migration
  def change
    create_table :blogger_articles do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
