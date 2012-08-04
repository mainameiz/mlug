require 'spec_helper'

describe "CommentsCreations" do

  it "should create new comment to post" do
    login_as(:user)
    @post = FactoryGirl.create(:post, author: @user)
    visit post_path(@post)
    #save_and_open_page
    fill_in 'comment_text', with: 'Very useful comment!'
    find('#new_comment').find('input[type="submit"]').click
    page.should have_content('Very useful comment!')
  end
end
