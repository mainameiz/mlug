# coding: utf-8
require 'spec_helper'

describe "PasswordResets" do
  it "emails user when requesting password reset" do
    pending "later on"
    login_as(:user)
    visit new_user_password_path
    fill_in "Email", :with => @user.email
    find("#new_user").find('input[type="sumbit"]').click
  end
end
