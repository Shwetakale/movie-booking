# frozen_string_literal: true

# This class will perform operations related to seat reservation
class ReservationSeat < ApplicationRecord
  belongs_to :reservation
  belongs_to :seat

  before_validation :set_price

  private

  def set_price
    self.price = seat.price
  end
end
