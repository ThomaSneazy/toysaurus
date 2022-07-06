class BookingsController < ApplicationController
  def create
    @toy = Toy.find(params[:toy_id])
    @booking = Booking.new(booking_params)
    @booking.toy = @toy
    @booking.user = current_user
    if @booking.save
      render :show
    else
      redirect_to toy_path(@toy)
    end
  end

  def update
  end

  def show
    @booking = Booking.find_by(toy: params[:toy_id], user: current_user)
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
