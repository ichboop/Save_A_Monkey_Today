class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @monkeys = Monkey.all

    # the `geocoded` scope filters only monkeys with coordinates (latitude & longitude)
    @markers = @monkeys.geocoded.map do |monkey|
      {
        lat: monkey.latitude,
        lng: monkey.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { monkey: monkey }),
        image_url: helpers.asset_url('440monkey.svg')
      }
    end
  end
end
