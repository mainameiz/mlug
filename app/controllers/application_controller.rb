class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = I18n.t('access_denied')
    redirect_to root_url
  end
end
