require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    it "displays recent posts" do
      post = create(:post)
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "displays about page" do
      get 'about'
      response.should be_success
    end
  end

end
