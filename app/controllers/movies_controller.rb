# frozen_string_literal: true

# This controller will handle movie related requests
class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    # This will fetch all movies with show for future date
    if current_user.admin?
      @movies = Movie.joins(:movie_screens).distinct('movies.id').order(:release_date)
    else
      @movies = Movie.joins(:movie_screens).where('start_time > ?', Time.now).distinct('movies.id').order(:release_date)
    end
      # Fecth upcoming movies
  end
end
