class MonkeysController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @monkeys = Monkey.all
  end

  def show
    @monkey = Monkey.find(params[:id])
  end
end
