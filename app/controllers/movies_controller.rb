# frozen_string_literal: true

# This controller will handle movie related requests
class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    # This will fetch all movies with show for future date
    @movies = Movie.joins(:movie_screens).where('date > ?', Date.today).distinct('movies.id').order(:release_date)

    # Fecth upcoming movies
  end
end
