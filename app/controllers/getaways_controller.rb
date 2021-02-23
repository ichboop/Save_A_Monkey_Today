class GetawaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def show
    @monkey = Monkey.find(28)
  end

  def new
  end

  def create
  end
end
