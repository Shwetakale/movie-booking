# frozen_string_literal: true

# This controller will handle all report related requests
class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_movie

  def index
    @data = @movie.movie_screens.includes(reservations: :reservation_seats)
  end

  private

  def load_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end
end
