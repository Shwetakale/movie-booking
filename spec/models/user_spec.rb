# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#callback' do
    it 'will assign default role if role is not passed while creating record' do
      user = User.create(email: 'test@test.com', password: '12341234')
      expect(user.role).to eql User::DEFAULT_ROLE
    end

    it 'will assign role if role is not passed while creating record' do
      user = User.create(email: 'test@test.com', password: '12341234', role: User::ROLES[:admin])
      expect(user.role).to eql User::ROLES[:admin]
    end
  end

  describe 'methods' do
    let!(:user) { create(:user) }
    context '#admin?' do
      it 'will return true if role is admin' do
        user.update(role: User::ROLES[:admin])
        expect(user.admin?).to eq true
      end

      it 'will return false if role is not admin' do
        expect(user.admin?).to eq false
      end
    end

    context '#customer' do
      it 'will return true if role is customer' do
        expect(user.customer?).to eq true
      end

      it 'will return false if role is not customer' do
        user.update(role: User::ROLES[:admin])
        expect(user.customer?).to eq false
      end
    end
  end
end
