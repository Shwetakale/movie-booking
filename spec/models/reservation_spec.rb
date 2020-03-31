# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe '#callbacks' do
    context '#calculate_price' do
      it 'will store cummulative price in reservation table' do
        reservation = create(:reservation)
        create(:reservation_seat, reservation: reservation, price: 100, reservation: reservation)
        create(:reservation_seat, reservation: reservation, price: 300, reservation: reservation)
        reservation.save
        expect(reservation.price).to eq 400
      end
    end
  end
end
