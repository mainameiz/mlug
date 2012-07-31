require 'factory_girl_rails'

FactoryGirl.build(:user).save
FactoryGirl.create(:post)
