# frozen_string_literal: true

# Class to get screen details
class ScreensController < ApplicationController
  before_action :authenticate_user!
  before_action :load_movie

  def index
    if @movie.present?
      @screens = @movie.screens.joins(:movie_screens)
                       .select('screens.name, movie_screens.start_time, movie_screens.date, movie_screens.id as msid')
                       .order('movie_Screens.date, movie_screens.start_time')
    else
      flash[:danger] = I18n.t('movies.not_found')
    end
  end

  private

  def load_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end
end
