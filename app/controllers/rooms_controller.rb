class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      flash[:notice] = "登録が完了しました。"
      redirect_to @room
    else
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def search
    @results = @q.result
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :room_about, :price, :adress, :user_id, :image)
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
