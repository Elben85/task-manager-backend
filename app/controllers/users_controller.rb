class UsersController < ApplicationController
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
      token = Token.find_by_userId(user.id);
      if token.nil?
        new_token = Token.create(userId: user.id, username: params[:username], token: SecureRandom.alphanumeric(64));
        render json: token;
      else
        render json: token;
      end
    else
      render json: {};
    end
  end

  private
  def user_param
    params.require(:user).permit(:username, :email, :password);
  end
end
