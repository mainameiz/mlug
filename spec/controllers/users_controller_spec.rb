require 'spec_helper'

describe UsersController do
  login_as(:user)

  describe "GET 'profile'" do
    it "returns http success" do
      visit user_profile_path(user)
      response.should be_success
    end
  end

end
