class Post < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, :link

  # Modify default as_json method for Post models to include comments.
  def as_json(options = {})
    super(options.merge(include: :comments))
  end
end
