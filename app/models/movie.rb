# frozen_string_literal: true

# This class will perform operations related to Movie
class Movie < ApplicationRecord
  validates :name, :description, :duration, :release_date, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
