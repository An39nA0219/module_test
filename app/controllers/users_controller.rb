class UsersController < ApplicationController
  def index
    @users = User.all
    @user_nicknames = @users.map{|user| user.name + "っち"}
  end

  def new
    @user = User.new
  end

  def create
    User.create!(user_params)
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
