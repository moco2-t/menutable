class HomeController < ApplicationController
    
def index
    @current_user = User.find_by(id:session[:user_id])
    if @current_user
        redirect_to about_path
    end
end

def about
end

def unauthenticated
end

end


