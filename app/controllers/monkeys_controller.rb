class MonkeysController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @monkeys = Monkey.all

    # the `geocoded` scope filters only monkeys with coordinates (latitude & longitude)
    @markers = @monkeys.geocoded.map do |monkey|
      {
        lat: monkey.latitude,
        lng: monkey.longitude
      }
    end
    if params[:query].present?
      sql_query = "name ILIKE :query OR species ILIKE :query"
      @monkeys = Monkey.where(sql_query, query: "%#{params[:query]}%")
    else
      @monkeys = Monkey.all
    end
  end

  def show
    @monkey = Monkey.find(params[:id])
  end
end
