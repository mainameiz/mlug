class Post < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :author,
    :class_name => "User",
    :foreign_key => "user_id"
  validates :author, :associated => true
end
