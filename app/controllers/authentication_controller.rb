class AuthenticationController < ApplicationController

  require 'json_web_token'

  before_action :authorize_request, except:[ :login, :cleaner_login]

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 2.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username, userId:@user.id }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

    def cleaner_login
    @cleaner = Cleaner.find_by_email(params[:email])
    if @cleaner&.authenticate(params[:password])
      token = JsonWebToken.encode(cleaner_id: @cleaner.id)
      time = Time.now + 2.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     name: @cleaner.name , cleanerid: @cleaner.id}, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end



  private

  def login_params
    params.permit(:email, :password)
  end



end