class Post < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :author,
    :class_name => "User",
    :foreign_key => "user_id"
  has_many :comments
  validates :author, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true

  def answers
    comments.select { |c| c.parent.nil? }
  end
end
