# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieScreen, type: :model do
  describe 'associations' do
    it { should belong_to(:movie) }
  end

  describe 'validations' do
    it { should validate_presence_of(:screen) }
    it { should validate_presence_of(:movie) }
    it { should validate_presence_of(:slot) }
  end
end
