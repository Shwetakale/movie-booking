# frozen_string_literal: true

# This class will perform operations related to Movie
class Screen < ApplicationRecord
  validates :name, uniqueness: { case_insensitive: true }

  has_many :movie_screens
  has_many :movies, through: :movie_screens

  ROWS = 8
  COLUMNS = 8
  PRICE_UPPER = 200
  PRICE_LOWER = 100
  MID = 32
end
