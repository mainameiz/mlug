class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent
  belongs_to :post
  attr_accessible :text
  validates :text,
    :presence => true,
    :length   => { :minimum => 1 }
end
