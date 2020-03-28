# frozen_string_literal: true

# This class will perform operations related to Movie
class Screen < ApplicationRecord
  validates :name, uniqueness: { case_insensitive: true }

  has_many :movie_screens
  has_many :movies, through: :movie_screens
end
