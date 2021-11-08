class ApplicationController < ActionController::Base
    add_flash_types  :success
    
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    
    def logged_in?
        !!current_user 
    end
    
    def require_user
        return if logged_in?
        flash[:danger] = "You must be logged in to perform that action."
        redirect_to login_path
    end
end
