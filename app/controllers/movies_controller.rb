# frozen_string_literal: true

# This controller will handle movie related requests
class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    # This will fetch all movies with show for future date
    @movies = if current_user.admin?
                Movie.distinct('movies.id').order(:release_date)
              else
                Movie.joins(:movie_screens).where('start_time > ?', Time.now).distinct('movies.id').order(:release_date)
              end
    # Fecth upcoming movies
  end
end
