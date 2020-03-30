# frozen_string_literal: true

# Class to get screen details
class ScreensController < ApplicationController
  before_action :authenticate_user!
  before_action :load_movie

  def index
    if @movie.present?
      @screens = @movie.screens.joins(:movie_screens).where('movie_screens.start_time > ?', Time.now)
                       .select('screens.name, movie_screens.start_time, movie_screens.start_time, movie_screens.id as msid')
        .order('movie_Screens.start_time, movie_screens.start_time').distinct("movie_screens.id")
    else
      flash[:danger] = I18n.t('movies.not_found')
    end
  end

  private

  def load_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end
end
