module ApplicationHelper

  def info_messages
    if notice
      notice
    end
    if alert
      alert
    end
  end
end
