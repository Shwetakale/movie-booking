# frozen_string_literal: true

# This class will perform operations related to movie_screen
class MovieScreen < ApplicationRecord
  belongs_to :screen
  belongs_to :movie
  belongs_to :slot
  has_many :seats
  has_many :reservations

  validates :screen, :movie, :slot, :start_time, presence: true
  validates :screen, uniqueness: { scope: %i[movie start_time slot] }

  after_create :initailize_seats

  def reserved_seats
    reservations.joins(reservation_seats: :seat).where(active: true, paid: true).pluck('seats.number')
  end

  def selected_seats(user_id = nil)
    if user_id.present?
      reservations.joins(reservation_seats: :seat).where(active: true, user_id: user_id, paid: false)
    else
      reservations.joins(reservation_seats: :seat).where(active: true, paid: false)
    end
  end

  def available_seats_count
    reservations.joins(reservation_seats: :seat).where(active: false).count
  end

  def stats
    reserved = reserved_seats.count
    selected = selected_seats.count
    available = seats.count - selected - reserved
    { reserved: reserved, selected: selected, available: available }
  end

  private

  def initailize_seats
    Screen::SEATS.each do |s|
      num = s[:low]
      (s[:high] - s[:low]).times do |i|
        num = num + 1
        seats.create(number: num, price: s[:price])
      end
    end
  end
end
