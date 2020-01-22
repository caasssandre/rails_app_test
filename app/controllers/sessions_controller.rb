class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Succesfully logged in"
      redirect_to users_path(user)
    else
      flash.now[:notice] = "There was something wrong with your info"
      render 'new'
    end
  end

  def destroy

  end

end
