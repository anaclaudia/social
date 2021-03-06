class UsersController < ApplicationController
  before_action :logged_in?, only: [:destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.last(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
		@user = UserUpdateCommand.update!(@user, user_params)

		if @user.valid?
      flash[:success] = "Update success!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])

    if current_user
      @relationship = current_user.active_relationships.find_by(followed_id: @user.id)
      @new_relationship = current_user.active_relationships.build
    end
  end

  def create
    @user = User.new(user_params)
		@user = UserCreateCommand.create!(@user)

		if @user.valid?
      log_in @user
      flash[:success] = "User created!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :password, :password_confirmation, :website, :posts)
  end
end
