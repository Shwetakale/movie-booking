# frozen_string_literal: true

# This controller will handle all report related requests
class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_movie
  before_action :load_user, only: [:bookings]

  def index
    data = @movie.movie_screens.includes(:reservations)
    @reports = []
    data.each do |d|
      stats = d.stats
      @reports << { available: stats[:available], reserved: stats[:reserved], selected: stats[:selected],
                    screen_name: d.screen.name, time: d.start_time.strftime('%I %p'), date: d.start_time.strftime('%F') }
    end
  end

  def bookings
    @reports = []
    @user.reservations.order(:created_at).where(paid: true).includes(movie_screen: :movie).each do |res|
      ms = res.movie_screen
      @reports << { movie_name: ms.movie.name, screen: ms.screen.name,
                    seat_numbers: res.reservation_seats.joins(:seat).pluck('seats.number').join(','), date: ms.start_time.strftime('%F'), time: ms.start_time.strftime('%I %p') }
    end
  end

  private

  def load_user
    @user = User.find_by(id: params[:user_id])
  end

  def load_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end
end
