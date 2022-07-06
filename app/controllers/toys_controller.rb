class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!

  def index
    @toys = Toy.all
  end

  def show
    @toy = Toy.find(params[:id])
    @booking = Booking.new
    @reviews = []
    @review = Review.new(toy: @toy)
    @reviews.each do |review|
      @reviews << Review.find_by(id: review)
    end
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    if @toy.save
      redirect_to root_path(@toy)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @toy.update(toy_params)
    redirect_to toy_path(@toy)
  end

  private

  def set_toy
    @toy = Toy.find(params[:id])
  end

  def toy_params
    params.require(:toy).permit(:name, :price, :color)
  end
end
