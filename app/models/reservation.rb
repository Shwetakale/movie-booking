# frozen_string_literal: true

# This class will perform operations related to reservation
class Reservation < ApplicationRecord
  belongs_to :screen
  belongs_to :user
end
