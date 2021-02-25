class MonkeysController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @monkeys = Monkey.all

    # # the `geocoded` scope filters only monkeys with coordinates (latitude & longitude)
    # @markers = @monkeys.geocoded.map do |monkey|
    #   {
    #     lat: monkey.latitude,
    #     lng: monkey.longitude
    #   }
    # end
  end

  def new
    @monkey = Monkey.new
  end

  def create
    @monkey = Monkey.new(monkey_params)
    if @monkey.save
      redirect_to monkey_path(@monkey)
    else
      render 'new'
    end
  end

  def show
    find_monkey
  end
end

def destroy
end

private

def find_monkey
  @monkey = Monkey.find(params[:id])
end

def monkey_params
  params.require(:monkey).permit(:name, :describtion, :species, :photo)
end
