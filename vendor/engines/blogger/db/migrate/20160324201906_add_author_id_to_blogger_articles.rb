class AddAuthorIdToBloggerArticles < ActiveRecord::Migration
  def change
    add_column :blogger_articles, :author_id, :integer
  end
end
