# frozen_string_literal: true

# This class will perform operations related to reservation
class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_seats, dependent: :destroy

  before_save :calculate_price

  private

  def calculate_price
    self.price = reservation_seats.pluck(:price).sum
  end
end
