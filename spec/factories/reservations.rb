# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    screen { nil }
    user { nil }
    paid { false }
    active { false }
  end
end
