# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:release_date) }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many :movie_screens }
  end
end
