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
            flash[:success] = "User created #{@user.firstname}"
            return redirect_to root_path

        else
          flash.now[:danger] = @user.errors.full_messages #"Could not sign up"
          render 'new'
        end
    end

    private
      def user_params
        params.require(:user).permit(:firstname, :surname, :email, :password, :password_confirmation)
    end
end
