class SessionsController < ApplicationController
	layout "session"

  def new
  end

  def create
    user = User.find_by(website: params[:session][:website].downcase)
    if 
      user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid email or password!"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
