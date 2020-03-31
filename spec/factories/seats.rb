# frozen_string_literal: true

FactoryBot.define do
  factory :seat do
    row { 'M' }
    number { 1 }
    movie_screen
  end
end
