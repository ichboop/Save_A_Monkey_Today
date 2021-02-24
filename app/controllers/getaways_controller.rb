class GetawaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index 
    @getaways = Getaway.where(user_id: 435)
    @monkeys = []
    @getaways.each do |getaway|
      @monkeys << Monkey.find(getaway.monkey_id)
    end
  end
  def show 

  end

  def new
  end

  def create
  end
end
