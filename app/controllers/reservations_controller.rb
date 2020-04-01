# frozen_string_literal: true

# Reservation controller
class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_movie_screen
  before_action :load_seat, only: [:cart_action]
  before_action :active_reservation_and_seats, only: [:cart_action, :index]
  before_action :load_reservation, only: [:book, :order]

  def index
    reservation_data
  end

  def cart_action
    if params[:user_action].eql?('add')
      @seats.create(seat_id: @seat.id, price: @seat.price)
    else
      @seats.find_by(seat_id: @seat.id)&.destroy
    end
    @active_reservation.save
    reservation_data
    render action: 'cart_action', layout: false
  end

  def book
    @reservation.update_attributes(paid: true)
    flash[:success] = I18n.t('reservation.book')
    redirect_to order_movie_screen_reservation_path(@reservation.movie_screen.movie_id, @reservation.id)
  end

  def clear_cart
    current_user.reservations.where(paid: false).destroy_all
    reservation_data
    render action: 'cart_action', layout: false
  end

  def order
  end

  private

  def active_reservation_and_seats
    params = { active: true, paid: false, movie_screen_id: @movie_screen.id }
    @active_reservation = current_user.reservations.find_or_create_by(params)
    @seats = @active_reservation.reservation_seats
  end

  def reservation_data
    @reserved_seats = @movie_screen.reserved_seats
    @selected_seats = @movie_screen.selected_seats(current_user.id).pluck("seats.number")
    @columns = Screen::COLUMNS
    @rows = Screen::ROWS
    @price_ranges = Screen::SEATS
    @total = @active_reservation&.price
  end

  def load_movie_screen
    @movie_screen = MovieScreen.find_by(id: params[:movie_screen_id])
  end

  def load_seat
    @seat = @movie_screen.seats.find_by(number: params[:current][:index])
  end

  def load_reservation
    @reservation = Reservation.find_by(id: params[:id])
  end
end
