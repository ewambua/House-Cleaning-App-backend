class UsersController < ApplicationController

    before_action :authorize_request, except: [:create, :update]


    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def create
        @user = User.create!(user_params)

        if @user.save
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        unless @user.update(user_params)
            render json: {errors: @user.errors.full_messages},status: :unprocessable_entity
        end
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:name, :username, :email, :password, :is_admin)
    end
end
