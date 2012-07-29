# coding: utf-8
require 'spec_helper'

describe "PasswordResets" do
  it "emails user whenrequesting password reset" do
    user = create(:user)
    visit new_user_session_path
    click_link "пароль"
    fill_in "Email", :with => user.email
    click_button "reset password"
  end
end
