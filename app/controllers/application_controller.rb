class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        else
            @current_user = nil
        end
    end

    def logged_in?
        current_user ? true : false
    end

end
