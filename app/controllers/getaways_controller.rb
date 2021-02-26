class GetawaysController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index]

  def index 
    #@getaways = Getaway.where(user_id: 455)
    @getaways = Getaway.where(user_id: current_user.id)
    @monkeys = []
    @getaways.each do |getaway|
      @monkeys << Monkey.find(getaway.monkey_id)
    end
    @getaways = @getaways.reverse
  end
  def show 
    @getaway = Getaway.create
  end

  def create
    @monkey = Monkey.find(params[:getaway][:monkey_id])
    @getaway = Getaway.new(create_getaway_params)
    @getaway.monkey = @monkey
    @getaway.user = current_user
    if !@getaway.date?
      redirect_to monkey_path(@monkey), alert: "please fill date"
    else 
      if @getaway.save
      
        redirect_to getaways_path
      else
        render "monkeys/show"
      end
    end
  end

  private

  def create_getaway_params
    params.require(:getaway).permit(:date)
  end
end
