# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: [:bookings]

  def index
    @users = User.all
  end

  def bookings
    @reports = @user.reservations.includes(movie: :movie_screen)
  end

  private

  def load_user
    @user = User.find_by(id: params[:user_id])
  end
end
