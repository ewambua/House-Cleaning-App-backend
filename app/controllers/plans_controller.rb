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

    def create
        plan = Plan.create!(plan_params)
        if plan.save
            render json: plan, status: :created
        else
            render json: {errors: plan.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        unless plan.update(plan_params)
            render json: {errors: plan.errors.full_messages},status: :unprocessable_entity
        end
    end

    def destroy
    end

    private

    def plan_params
        params.permit(:name, :price, :task_one, :task_two, :task_two, :task_three, :description)
    end

    def rescue_from_not_found
        render json: {error: "Try again"}, status: :not_found
    end
end
