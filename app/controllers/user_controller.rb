class UserController < ApplicationController     
 

def login_form
end

def login
    @user = User.find_by(login_id:params[:login_id])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:notice]= "ログインしました"
        redirect_to("/about")
    else
        @error_message="IDまたはパスワードが違っています。再度入力してください。"
        @login_id = params[:login_id]
        @password = params[:password]
        render("user/login_form")
    end
end

def new_account
    
end

def create_account
    @user = User.new(
        login_id: params[:login_id],
        password: params[:password]
        )
    if @user.save
        session[:user_id] = @user.id
        flash[:notice]= "ログインしました"
        redirect_to("/about")
    else
        @login_id = params[:login_id]
        @password = params[:password]
        render("user/new_account")
    end
end

def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
end


def destroy_account
    @current_user.destroy
    session[:user_id] = nil
    flash[:success] = "アカウントを削除しました"
    redirect_to("/")
end

def edit_account

end

def update_account
    @current_user.login_id = params[:login_id]
    @current_user.password = params[:password]   
    if @current_user.save
        flash[:notice]= "変更しました"
        redirect_to("/users/#{@current_user.id}")
    else
        render("user/edit_account")
    end
end

end
