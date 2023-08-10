# app/controllers/requests_controller.rb
class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.create!(request_params)
    if @request.save
      render json: { message: 'Request created successfully' }, status: :created
    else
      render json: { error: 'Error creating request' }, status: :unprocessable_entity
    end
  end

 def update
    if @request.update(request_params)
      render json: { message: 'Request updated successfully' }, status: :ok
    else
      render json: { error: 'Error updating request' }, status: :unprocessable_entity
    end
  end



  def destroy
    @request.destroy
    head :no_content
    render json: { message: 'Request destroyed successfully' }, status: :ok
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.permit(:task_one, :task_two, :task_three, :user_id, :cleaner_id, :status)
  end
end
