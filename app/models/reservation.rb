# frozen_string_literal: true

# This class will perform operations related to reservation
class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_seats
end
