# frozen_string_literal: true

FactoryBot.define do
  factory :movie_screen do
    movie
    slot
    screen
    start_time { '2020-03-28' }
  end
end
