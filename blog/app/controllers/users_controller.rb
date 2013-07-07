class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
