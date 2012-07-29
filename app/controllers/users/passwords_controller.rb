class Users::PasswordsController < Devise::PasswordsController
  skip_before_filter :require_no_authentication, :only => :new
end
