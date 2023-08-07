class CleanersController < ApplicationController

    before_action :authorize_request, except: [:create, :update, :index]


    def index
        @cleaner = Cleaner.all
        render json: @cleaner, status: :ok
    end

    def create
        @cleaner = Cleaner.create!(cleaner_params)

        if @cleaner.save
            render json: @cleaner, status: :created
        else
            render json: {errors: @cleaner.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        unless @cleaner.update(cleaner_params)
            render json: {errors: @cleaner.errors.full_messages},status: :unprocessable_entity
        end
    end

    private

    def find_cleaner
        @cleaner = Cleaner.find(params[:id])
    end

    def cleaner_params
        params.permit(:name, :email, :password, :description, :image_url)
    end

end
