# frozen_string_literal: true

# This class will perform operations related to movie_screen
class MovieScreen < ApplicationRecord
  belongs_to :screen
  belongs_to :movie
  belongs_to :slot

  validates :screen, :movie, :slot, :date, presence: true
  validates :screen, uniqueness: { scope: %i[movie date slot] }

  before_validation :copy_start_time_from_slot

  private

  def copy_start_time_from_slot
    self.start_time = slot.start_time
  end
end
