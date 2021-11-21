class SessionsController < ApplicationController
    def new 
        session[:user_id] = nil 
    end
    def create 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Welcome back #{user.username}"
        else  
            render :new
        end
    end
    def destroy 
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged Out"
    end
end
