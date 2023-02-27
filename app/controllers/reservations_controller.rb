class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :confirm]

  def index
    @reservations = Reservation.all
  end

  def confirm
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    @reservation.room = @room
    if @reservation.invalid?
      render template: 'rooms/show'
    else  
      @dates_of_reservation = (@reservation.finish_date - @reservation.start_date).to_i
    end  
  end

  def create
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    @reservation.room = @room
    if params[:back]
      render template: 'rooms/show'
    elsif @reservation.save
      flash[:notice] = "予約が完了しました。"
      redirect_to reservations_show_path(@reservation.id)
    else
      flash[:alert] = "予約に失敗しました"
      render room_path(@reservation.room.id)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @dates_of_reservation = (@reservation.finish_date - @reservation.start_date).to_i
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :room_id)
  end 

end
