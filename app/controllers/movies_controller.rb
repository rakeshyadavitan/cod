class MoviesController < ApplicationController

  before_action :fetch_movies

  def index
    json_response(movies: fetch_movies)
  end

  def movies_and_seasons
    seasons =  Season.recent
    movies_and_seasons = fetch_movies + seasons
    json_response(movies_and_seasons: movies_and_seasons.sort_by! {|u| u.created_at})
  end

  private

    def fetch_movies
      Movie.recent
    end

end
