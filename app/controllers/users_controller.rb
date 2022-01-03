class UsersController < ApplicationController
  def index
    @users = User.all
    @user_nicknames = @users.map{|user| user.name + "っち"}
  end
end
