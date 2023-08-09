class ReviewsController < ApplicationController


  def index
    render json: Review.all
  end

  def show
    cleaner = Cleaner.find(params[:id])
    render json: cleaner.reviews
  end

  def create
    @review = Review.create!(review_params)

    if @review.save
      render json: @review, status: :created
    else
      render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])

    if @review.destroy
      render json: {message: "Review successfully deleted"}, status: :ok
    else
      render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def update
    unless @review.update(review_params)
      render json: {errors: @review.errors.full_messages},status: :unprocessable_entity
    end
  end




  private

  def review_params
    params.permit(:score, :rating, :review, :cleaner_id, :user_id)
  end
end