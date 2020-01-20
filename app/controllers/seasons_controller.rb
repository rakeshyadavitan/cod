class SeasonsController < ApplicationController

  def index
    seasons = Season.order(:created_at)
    render json: seasons.to_json(include: :episodes)
  end

end
