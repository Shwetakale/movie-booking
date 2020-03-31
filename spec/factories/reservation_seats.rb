# frozen_string_literal: true

FactoryBot.define do
  factory :reservation_seat do
    reservation
    seat
    price { 100 }
  end
end
