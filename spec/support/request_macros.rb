module RequestMacros
  def login_as(role)
    role_obj = FactoryGirl.create(role.to_sym)
    instance_variable_set("@#{role}", role_obj)
    visit send("new_#{role}_session_path")
    fill_in "#{role}_email", with: role_obj.email
    fill_in "#{role}_password", with: role_obj.password
    find("#new_#{role}").find('input[type="submit"]').click
  end
end
