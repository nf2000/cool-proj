class SessionsController < ApplicationController

    def new
    end
    
    def create
        @user = User.find_by_email( params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            flash.now[:success] = "Logged in successfully."
            redirect_to root_path
          
        else
           
          flash[:danger] = "Invalid password or/and email."
          render 'new'
        end
      end
       
    def destroy
        session[:user_id] = nil
        flash.now[:success] = "You have been logged out."
        redirect_to login_path
    end

    def edit 
        if logged_in?
            redirect_to logout_path
          else
            redirect_to login_path
        end
        
    end
end
