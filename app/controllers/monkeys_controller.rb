class MonkeysController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @monkeys = Monkey.all

    if params[:query].present?
      sql_query = "name ILIKE :query OR species ILIKE :query"
      @monkeys = Monkey.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:address].present?
      sql_query = "address @@ :address"
      @monkeys = Monkey.where(sql_query, address: "%#{params[:address]}%")
    else
      @monkeys = Monkey.all
    end

    # the `geocoded` scope filters only monkeys with coordinates (latitude & longitude)
    @markers = @monkeys.geocoded.map do |monkey|
      {
        lat: monkey.latitude,
        lng: monkey.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { monkey: monkey }),
        image_url: helpers.asset_url('440monkey.svg')
      }
    end
  end

  def show
    @monkey = Monkey.find(params[:id])
  end
end
