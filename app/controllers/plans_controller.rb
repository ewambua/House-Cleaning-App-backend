class PlansController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

    def index
        plans = Plan.all
        render json: plans, status: :ok
    end

    def show
        plan = Plan.find(params[:id])
        render json: plan,  status: :ok
    end

    private

    def rescue_from_not_found
        render json: {error: "Band Profile not found"}, status: :not_found
    end
end
