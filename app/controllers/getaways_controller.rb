class GetawaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def show
    @getaways = Getaway.where(user_id: 35)
    @monkeys = @getaways.map do |getaway|
      Monkey.where(id: getaway.monkey_id)
    end
  end

  def new
  end

  def create
  end
end
