class Comment < ActiveRecord::Base
  belongs_to :author,
    :class_name => "User",
    :foreign_key => "user_id"
  belongs_to :parent,
    class_name: 'Comment'
  belongs_to :post
  attr_accessible :text
  validates :text,   presence: true
  validates :author, presence: true
  validates :post,   presence: true

  def answers
    post.comments.select { |c| c.parent == self }
  end
end
