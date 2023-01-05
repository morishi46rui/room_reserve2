class HomesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def search
    @results = @q.result
  end

  private
    def set_q
      @q = Room.ransack(params[:q])
    end

end
