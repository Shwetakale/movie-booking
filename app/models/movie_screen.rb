# frozen_string_literal: true

# This class will perform operations related to movie_screen
class MovieScreen < ApplicationRecord
  belongs_to :screen
  belongs_to :movie
  belongs_to :slot

  validates :screen, :movie, :slot, :date, presence: true
  validates :screen, uniqueness: { scope: %i[movie date slot] }
end
