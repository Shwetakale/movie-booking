# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :movie do
    name { Faker::Name.name }
    description { 'MyText' }
    duration { '120' }
    release_date { '2020-03-28' }
    image_url { 'MyString' }
  end
end
