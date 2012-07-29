class Users::ProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  def show
  end
  
  def update
    if current_user.update_attributes(params[:user])
      flash.now[:notice] = "updated"
    else
      flash.now[:alert] = "error"
    end
    render :show
  end 
end
