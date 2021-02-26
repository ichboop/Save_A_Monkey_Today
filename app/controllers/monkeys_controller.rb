class MonkeysController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @monkeys = Monkey.all
    @headline = "All monkeys!"
    if params[:query].present?
      sql_query = "name ILIKE :query OR species ILIKE :query"
      @monkeys = Monkey.where(sql_query, query: "%#{params[:query]}%").geocoded + (Monkey.near(params[:query], 50))
      @headline = "You searched for #{params[:query]}? Here are your results!"
    else
      @monkeys = Monkey.all
    end

    # the `geocoded` scope filters only monkeys with coordinates (latitude & longitude)
    @markers = @monkeys.map do |monkey|
      {
        lat: monkey.latitude,
        lng: monkey.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { monkey: monkey }),
        image_url: helpers.asset_url('440monkey.svg')
      }
    end
  end

  def new
    @monkey = Monkey.new
  end

  def create
    @monkey = Monkey.new(monkey_params)
    @monkey.user_id = current_user.id
    if @monkey.save
      redirect_to monkey_path(@monkey)
    else
      render 'new'
    end
  end

  def show
    find_monkey
  end

  def destroy
    find_monkey
    @monkey.destroy
    redirect_to monkeys_path
  end

  private

  def find_monkey
    @monkey = Monkey.find(params[:id])
    @getaway = Getaway.new
  end

  def monkey_params
    params.require(:monkey).permit(:name, :description, :species, :address, :city, photos: [])
  end

end

