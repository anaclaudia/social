class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    user = User.find_by(website: params[:session][:website].downcase)
    if 
      user && user.autenticate(params[:session][:password])
    else
      flash[:danger] = "Invalid email or password!"
      render 'new'
    end
  end

  def destroy
  end
end
