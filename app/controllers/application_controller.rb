class ApplicationController < ActionController::Base
  before_action :set_current_user,:authenticate_user, except: [:index,:unauthenticated,:login_form,:new_account,:login,:create_account]
  def set_current_user
    @current_user = User.find_by(id:session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      redirect_to("/unauthenticated")
    end
  end

end
