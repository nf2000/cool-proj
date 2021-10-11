class UsersController < ApplicationController

    def index
        @users = User.all
        #@current_user = User.find_by_id(session[:current_user_id])
    end
    def new
        @user = User.new
    end
      
    def create
        @user = User.new(user_params)
        @name = @user.firstname
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "User created #{@name}"
 
            return redirect_to root_path()

        else
          render 'new'
        end
    end
      
    private
      
      def user_params
        params.require(:user).permit(:firstname, :surname, :email, :password)
      end
    
end
