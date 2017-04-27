class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user

  private

 def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end


 def authorize
   redirect_to root_path unless current_user
 end

 # you have to be logged in to access information
def ensure_logged_in
  unless current_user
    flash[:alert] = "Please log in"
    redirect_to new_session_path
  end
end





end
