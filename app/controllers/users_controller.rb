require 'bcrypt'
class UsersController < ApplicationController
  include BCrypt
  def index
    users = User.order(:id);
    render json: users;
  end

  def create
    salted_password = BCrypt::Password.create(params[:password]).cost;
    params[:password] = salted_password;
    user = User.create(user_param);
    render json: user;
  end

  def login
    user = User.find_by_username(params[:username]);
    if user.nil? 
      render json: {};
    elsif user.password == params[:password]
      render json: user;
    else
      render json: {};
    end
  end

  private
  def user_param
    params.require(:user).permit(:username, :email, :password);
  end
end
