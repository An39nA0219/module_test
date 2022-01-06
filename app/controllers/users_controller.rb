class UsersController < ApplicationController
  def index
    users = User.all.select(:id, :name).map{|user| 
      Hash[
        :id, user.id, 
        :name, user.name,
        :nickname, "#{user.name}っち"
      ]
    }
    render json: users
  end

  def create
    User.create!(user_params) ? (render json: :success) : (render json: :failed)
  end

  def update
    user = User.find_by(id: params[:id])
    user.update!(user_params) ? (render json: :success) : (render json: :failed)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
