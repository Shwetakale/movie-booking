# frozen_string_literal: true

FactoryBot.define do
  factory :screen do
    name { Faker::Name.name }
  end
end
