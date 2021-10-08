class SessionsController < ApplicationController

    def create
        @user = User.find_by_email( params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            flash[:success] = "Logged in successfully."
            return redirect_to root_path
          
        else
           
          flash[:danger] = "There was something wrong with your login details."

          render 'new'
        end
      end
       
    def destroy
        User.find(session[:user_id]).destroy
        session[:user_id] = nil
        flash[:success] = "You have been logged out."
        redirect_to login_path
    end

    def edit 
        if logged_in?
            return redirect_to logout_path
          else
            render  redirect_to login_path
        end
        
    end
end
