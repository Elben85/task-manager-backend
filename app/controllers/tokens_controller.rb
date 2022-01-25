class TokensController < ApplicationController
  def index
    tokens = Token.order(params[:id]);
    render json: tokens;
  end

  def me
    user = Token.find_by_token(params[:token]);
    if user.nil? 
      render json: {};
    else 
      render json: user;
    end
  end

  def auth
    user = Token.find_by_token(params[:token]);
    if user.nil?
      render json: {};
    elsif user.userId != params[:userId];
      render json: {};
    else
      render json: user;
    end
  end
end
