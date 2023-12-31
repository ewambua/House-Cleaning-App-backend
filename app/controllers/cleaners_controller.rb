class CleanersController < ApplicationController
    before_action :find_cleaner, only: [:show, :update]

    before_action :authorize_cleaner_request, except: [:show, :create, :update, :index]
    def index
      @cleaners = Cleaner.all
      render json: @cleaners, status: :ok
    end

    def show
        render json: @cleaner, include: [:reviews, :requests], status: :ok
      end

    def create
      @cleaner = Cleaner.create!(cleaner_params)

      if @cleaner.save
        render json: @cleaner, status: :created
      else
        render json: { errors: @cleaner.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      unless @cleaner.update(cleaner_params)
        render json: { errors: @cleaner.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def find_cleaner
      @cleaner = Cleaner.find(params[:id])
    end

    def cleaner_params
      params.permit(:name, :email, :description, :password, :password_confirmation, :image_url)
    end
  end
