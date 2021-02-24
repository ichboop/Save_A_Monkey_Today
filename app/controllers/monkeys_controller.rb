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
  end

  def show
    @monkey = Monkey.find(params[:id])
  end
end
