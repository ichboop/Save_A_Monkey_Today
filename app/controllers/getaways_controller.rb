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
    
    @getaway = Getaway.new(
      date: Date.today,
      monkey_id: params[:getaway]["monkey_id"],
      user_id: current_user.id
    )
    @getaway.save
  end
end
