class ApplicationController < ActionController::Base
=begin
before_action:authenticate_user
before_action:set_current_user

def set_current_user
  @current_user = User.find_by(id:session[:user_id])
end

def authenticate_user
    if @current_user == nil
        flash[:notice] = "ログインが必要です"
    end       
end
=end

end
