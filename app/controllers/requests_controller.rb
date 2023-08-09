class RequestsController < ApplicationController
    def index
      @requests = Request.all
    end

    def show
      @request = Request.find(params[:id])
    end

    def new
      @request = Request.new
    end

    def create
      @request = Request.new(request_params)
      if @request.save
        render json: { message: 'Request was successfully created.' }, status: :created
      else
        render json: { error: 'Failed to create request.' }, status: :unprocessable_entity
      end
    end

    def edit
      @request = Request.find(params[:id])
    end

    def update
      @request = Request.find(params[:id])
      if @request.update(request_params)
        render json: { message: 'Request was successfully updated.' }, status: :ok
      else
        render json: { error: 'Failed to update request.' }, status: :unprocessable_entity
      end
    end

    def destroy
      @request = Request.find(params[:id])
      if @request.destroy
        render json: { message: 'Request was successfully destroyed.' }, status: :ok
      else
        render json: { error: 'Failed to destroy request.' }, status: :unprocessable_entity
      end
    end

    private

    def request_params
      params.permit(:status, :task_one, :task_two, :task_three, :user_id, :cleaner_id)
    end
  end
