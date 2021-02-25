class GetawaysController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index]

  def index 
    #@getaways = Getaway.where(user_id: 455)
    @getaways = Getaway.where(user_id: current_user.id)
    @monkeys = []
    @getaways.each do |getaway|
      @monkeys << Monkey.find(getaway.monkey_id)
    end
  end
  def show 
    @getaway = Getaway.create(

    )
  end

  def new
   
  end

  def create
    raise
  end
end
