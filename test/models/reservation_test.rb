require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  def setup
    @reservation = create :reservation
  end

  test 'should be valid' do
    assert @reservation.valid?
  end

  test 'price should be present' do
    @reservation.price = nil

    refute @reservation.valid?
  end

  test 'price should be a number' do
    @reservation.price = 'invalid'

    refute @reservation.valid?
  end

  test 'price should not be negative' do
    @reservation.price = -10

    refute @reservation.valid?
  end

  test 'price should have 2 decimals' do
    @reservation.price = 105.656

    refute @reservation.valid?
  end

  test 'currency should be present' do
    @reservation.currency = ''

    refute @reservation.valid?
  end

  test 'currency should be valid' do
    @reservation.currency = 'invalid'

    refute @reservation.valid?
  end

  test 'entry date should be present' do
    @reservation.entry_date = nil

    refute @reservation.valid?
  end

  test 'departure date should be present' do
    @reservation.departure_date = nil

    refute @reservation.valid?
  end

  test 'departure date should be greater than entry date' do
    @reservation.departure_date = @reservation.entry_date - 1.day

    refute @reservation.valid?
  end

  test 'guest email should be present' do
    @reservation.guest_email = ''

    refute @reservation.valid?
  end

  test 'guest email should be valid' do
    @reservation.guest_email = 'invalid'

    refute @reservation.valid?
  end
end
