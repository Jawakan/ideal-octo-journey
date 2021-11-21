class UsersController < ApplicationController
    def index 
        @users = User.all
    end
    def new 
        @user = User.new 
    end
    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Hello #{user.username}"
        else
            render :new, alert: "User not found"
        end
    end
    def destroy
        @user = @current_user
        @user.username = nil
        @user.password = nil
        redirect_to root_path
    end
    private 
    def user_params 
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
