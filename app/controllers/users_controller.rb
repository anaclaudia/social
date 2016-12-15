class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.last(5)
  end

  def show
    @user = User.find(params[:id])
    
    @links = Website.parse(@user.website)

    if current_user
      @relationship = current_user.active_relationships.find_by(followed_id: @user.id)
      @new_relationship = current_user.active_relationships.build
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user

      flash[:success] = "User created!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :password, :password_confirmation, :website)
  end
end
