class GetawaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index 
    #@getaways = Getaway.where(user_id: 455)
    @getaways = Getaway.where(user_id: current_user.id)
    @monkeys = []
    @getaways.each do |getaway|
      @monkeys << Monkey.find(getaway.monkey_id)
    end
  end
  def show 

  end

  def new
    @getaway = Getaway.new
  end

  def create
    user_id = params[:id]
    monkey_id = params[:monkey_id]
    raise
    @getaway = Getaway.create()
  end
end
