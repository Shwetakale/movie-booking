# frozen_string_literal: true

# This class will perform operations related to Movie
class Movie < ApplicationRecord
  validates :name, :description, :duration, :release_date, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  has_many :movie_screens
  has_many :screens, through: :movie_screens
end
