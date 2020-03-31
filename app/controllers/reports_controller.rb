# frozen_string_literal: true

# This controller will handle all report related requests
class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_movie

  def index
    data = @movie.movie_screens.includes(:reservations)
    @reports = []
    data.each do |d|
      stats = d.stats
      @reports << { available: stats[:available], reserved: stats[:reserved], selected: stats[:selected], screen_name: d.screen.name, time: d.start_time }
    end
  end

  private

  def load_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end
end
