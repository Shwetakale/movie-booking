# frozen_string_literal: true

FactoryBot.define do
  factory :movie_screen do
    screen { nil }
    movie { nil }
    slot { nil }
    date { '2020-03-28' }
  end
end
