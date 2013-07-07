module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
    #  self.current_user = user
  end
end
