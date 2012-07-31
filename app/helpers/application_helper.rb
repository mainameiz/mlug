module ApplicationHelper

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
  
  def devise_registration_error_messages!(template_name)
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("devise.registrations.errors.messages.#{template_name}.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
<div id="error_explanation">
<h2>#{sentence}</h2>
<ul>#{messages}</ul>
</div>
HTML

    html.html_safe
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
