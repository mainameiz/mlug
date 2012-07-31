FactoryGirl.define do

  factory :user, :aliases => [ :author, :commenter ] do
    password "asdasd"
    sequence(:email) { |n| "asd#{n}@asd.ru" }
    after(:build) { |user| user.skip_confirmation! }
  end

  factory :post do
    author
    title 'Title'
    body 'Lorem Ipsum ...'
  end

  factory :comment, :aliases => [ :parent ] do
    commenter
    post
    parent
  
    text 'Useful comment'
  end
end
