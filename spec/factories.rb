FactoryGirl.define do
  factory :user, :aliases => [ :author, :commenter ] do
    password "asdasd"
#  password_confirmation { |u| u.password }
    email { "asd#{id}@asdasd.ru" }
  end

  factory :post do
    author
    title 'Title'
    body 'Lorem Ipsum ...'
  end

  #factory :comment, :aliases => [ :parent_comment ] do
  #  commenter
  #  post
  #  parent_comment
  #
  #  body 'Useful comment'
  #end
end
