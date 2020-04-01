# frozen_string_literal: true

# This class will perform operations related to Movie
class Screen < ApplicationRecord
  validates :name, uniqueness: { case_insensitive: true }

  has_many :movie_screens
  has_many :movies, through: :movie_screens

  # Thes 3 are dependent on each other and needs to be moved in seperate table
  ROWS = 8
  COLUMNS = 8
  SEATS = [{ low: 0, high: 23, price: 100, rows: %w[A B] }, { low: 24, high: 47, price: 150, rows: %w[C D E] }, { low: 48, high: 63, price: 200, rows: %w[F G H] }].freeze
end
