# This migration comes from blogger (originally 20160324201906)
class AddAuthorIdToBloggerArticles < ActiveRecord::Migration
  def change
    add_column :blogger_articles, :author_id, :integer
  end
end
