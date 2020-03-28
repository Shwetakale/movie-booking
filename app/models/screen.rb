# frozen_string_literal: true

# This class will perform operations related to Movie
class Screen < ApplicationRecord
  validates :name, uniquness: { case_insensitive: true }
end
