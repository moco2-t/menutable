class UserController < ApplicationController

def login_form
end

def login
    @user = User.find_by(login_id:params[:login_id])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:notice]= "ログインしました"
        redirect_to("/top")
    else
        @error_message="IDまたはパスワードが間違っています"
        @login_id = params[:login_id]
        @password = params[:password]
        render("user/login_form")
    end
end

def new
    
end

def create
    @user = User.new(
        login_id: params[:login_id],
        password: params[:password]
        )
    if @user.save
        session[:user_id] = @user.id
        flash[:notice]= "ユーザー登録が完了しました / ログインしました"
        redirect_to("/users/top")
    else
        @login_id = params[:login_id]
        @password = params[:password]
        render("user/new")
    end
end

def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/index")
end

def show
    
end

def destroy
    @current_user.destroy
    session[:user_id] = nil
    flash[:success] = "アカウントを削除しました"
    redirect_to("/index")
end

def edit

end

def update
    @current_user.login_id = params[:login_id]
    @current_user.password = params[:password]   
    if @current_user.save
        flash[:notice]= "変更しました"
        redirect_to("/users/#{@current_user.id}")
    else
        render("user/edit")
    end
end

def top

end

end
