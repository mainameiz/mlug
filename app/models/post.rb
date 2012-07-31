class Post < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :author,
    :class_name => "User",
    :foreign_key => "user_id"
  has_many :comments
  validates :author, :associated => true
end
