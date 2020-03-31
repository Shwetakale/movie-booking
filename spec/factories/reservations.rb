# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    user
    movie_screen
    paid { false }
    active { false }
  end
end
