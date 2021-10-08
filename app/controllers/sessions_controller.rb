class SessionsController < ApplicationController

    

    def create
        @user = User.find_by_email( params[:session][:email].downcase)

        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
         
          flash[:success] = "Logged in successfully."
          
        else
           
          flash[:danger] = "There was something wrong with your login details."

          render 'new'
        end
      end
       
      def destroy
        session[:user_id] = nil
        flash[:notice] = "You have been logged out."
        #redirect_to root_path
      end

      def edit 
        if logged_in?
            #link to logout path
          else
            #link to login path
          end
        
      end
end
