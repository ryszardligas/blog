class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    
  end
  
  def login_required
    if session[:user_id]
      return true
    else
      flash[:warning]='Please login to continue'
      #session[:return_to]=request.request_uri
      redirect_to :root
      return false 
    end
  end
  
    
end


