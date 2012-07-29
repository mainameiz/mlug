class UserPresenter < BasePresenter
  presents :user
  #delegate :
  
  def jabber
    user.jabber || 'none'
  end
  
  def city
    user.city || 'none'
  end
  
  def email
    user.email || 'none'
  end
  
  def nickname
    user.nickname || 'none'
  end
  
private

  def avatar_name
    if user.avatar_image_name.present?
      user.avatar_image_name
    else
      'default.png'
    end
  end
end
