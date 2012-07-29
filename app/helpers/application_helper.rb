module ApplicationHelper

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
  
  def info_messages
    if notice
      notice
    end
    if alert
      alert
    end
  end
end
