class UsersController < ApplicationController
   def index
    users = User.order(:timestamps);
    render json: users;
  end

  def create
    user = User.create(user_param);
    render json: user;
  end

  private
  def user_param
    params.require(:user).permit(:username, :email, :password);
  end
end
