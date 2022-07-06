class ReviewsController < ApplicationController
  def new
    @toy = Toy.find(params[:toy_id])
    @review = @Review.new
  end

  def create
    @toy = Toy.find(params[:toy_id])
    @review = Review.new(review_params)
    @review.toy = @toy
    if @review.save
      redirect_to toy_path(@toy)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to toy_path
  end


private

  def review_params
    params.require(:review).permit(:content, :rating, :toy_id)
  end
end
