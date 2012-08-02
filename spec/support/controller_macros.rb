module ControllerMacros
  def login_as(name)
    name = name.to_sym

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[name]
      object = FactoryGirl.create(name) # Using factory girl as an example
      self.class.send(:define_method, name, Proc.new {
        object
      })
      sign_in object
    end
  end
end
