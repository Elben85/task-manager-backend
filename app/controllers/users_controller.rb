require 'bcrypt'
class UsersController < ApplicationController
  include BCrypt
  def index
    users = User.order(:id);
    render json: users;
  end

  def create
    user = User.create(user_param);
    render json: user;
  end

  def signup
    check_username_taken =  User.find_by_username(params[:username]);
    if !check_username_taken.nil?
      render json: {error: 1};
    else
      check_email_taken = User.find_by_email(params[:email]);
      if !check_email_taken.nil?
        render json: {error: 2};
      else
        create();
      end
    end
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
