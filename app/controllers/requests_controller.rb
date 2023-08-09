class RequestsController < ApplicationController

    def index
        render json: Request.all, status: :ok
    end


    def create
        request = Request.create!(request_params)

        if request.save
            render json: request, status: :created
        else
            render json: {errors: request.errors.full_messages}, status: :unprocessable_entity
        end
    end


    def update
        request = Request.find(params[:id])

        if request.update(update_params)
            render json: {message: "Update successful"}, status: :ok
        else
            render json: {errors: request.errors.full_messages}, status: :unprocessable_entity
        end

    end


    def destroy
        request = Request.find(params[:id])
        request.destroy
        render json: {message:"Deleted successfully" }
    end

    private


    def request_params
        params.permit(:status, :user_id, :cleaner_id)
    end

    def update_params
        params.permit(:status)
    end

end
