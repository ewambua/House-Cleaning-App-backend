class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def show
      @cleaner = Cleaner.find(params[:id])
      @review = Review.find(params[:id])
    end

    def new
      @review = Review.new
    end

    def edit
       @picture = Cleaner.find(params[:cleaner_id])
       @review = Review.find(params[:id])
    end

    def create
      @cleaner = Cleaner.find(params[:cleaner_id])
      @review = @cleaner.reviews.build(params[:review])

      if @review.save
        ;flash[:notice] = 'Review was successfully created.'
        redirect_to @cleaner
      else
        flash[:notice] = "Error creating review: #{@review.errors}"
        redirect_to @cleaner
      end
    end

    def update
      @cleaner = Cleaner.find(params[:cleaner_id])
      @review = Review.find(params[:id])

      if @review.update_attributes(params[:review])
        flash[:notice] = "Review updated"
        redirect_to @cleaner
      else
        flash[:error] = "There was an error updating your review"
        redirect_to @cleaner
      end
    end

    def destroy
      @cleaner = Cleaner.find(params[:cleaner_id])
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to(@review.post)
    end

    private

    def set_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:review, :user_id, :cleaner_id)
    end
end
