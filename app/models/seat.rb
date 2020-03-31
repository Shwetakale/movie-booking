# frozen_string_literal: true

# This class will perform operations related to seat
class Seat < ApplicationRecord
  belongs_to :movie_screen
end
