class CleanersController < ApplicationController
    before_action :find_cleaner, only: [:show, :update]
  
    def index
      @cleaners = Cleaner.all
      render json: @cleaners, status: :ok
    end
  
    def show
        render json: @cleaner, include: [:reviews], status: :ok
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
        params.require(:cleaner).permit(:name, :email, :description, :password, :password_confirmation, :image_url)
      end
  end
  