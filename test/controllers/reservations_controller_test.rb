require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  include FactoryBot::Syntax::Methods

  setup do
    @reservation = create :reservation
  end

  test 'should get index' do
    get reservations_url

    assert_response :success
  end

  test 'should get index as json' do
    get reservations_url, as: :json

    assert_response :success
  end

  test 'should get new' do
    get new_reservation_url

    assert_response :success
  end

  test 'should create reservation' do
    assert_difference 'Reservation.count' do
      post reservations_url,
           params: {
             reservation: {
               currency:       @reservation.currency,
               departure_date: @reservation.departure_date,
               entry_date:     @reservation.entry_date,
               guest_email:    @reservation.guest_email,
               guest_name:     @reservation.guest_name,
               hotel_name:     @reservation.hotel_name,
               price:          @reservation.price
             }
           }
    end

    assert_redirected_to reservation_url(Reservation.last)
  end

  test 'should create reservation from json' do
    assert_difference 'Reservation.count' do
      post reservations_url,
           params: {
             reservation: {
               currency:       @reservation.currency,
               departure_date: @reservation.departure_date,
               entry_date:     @reservation.entry_date,
               guest_email:    @reservation.guest_email,
               guest_name:     @reservation.guest_name,
               hotel_name:     @reservation.hotel_name,
               price:          @reservation.price
             }
           },
           as: :json
    end

    assert_response :created
  end

  test 'should get unprocessable entity when create reservation with invalid params from json' do
    assert_no_difference 'Reservation.count' do
      post reservations_url, params: { reservation: { currency: @reservation.currency } }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test 'should show reservation' do
    get reservation_url(@reservation)

    assert_response :success
  end

  test 'should redirect to reservations when show invalid reservation' do
    get reservation_url(id: 'invalid_id')

    assert_redirected_to reservations_url
    assert_equal 'Reservation not found', flash[:alert]
  end

  test 'should show reservation as json' do
    get reservation_url(@reservation), as: :json

    assert_response :success
  end

  test 'should get not found when show invalid reservation as json' do
    get reservation_url(id: 'invalid_id'), as: :json

    assert_response :not_found
  end

  test 'should get edit' do
    get edit_reservation_url(@reservation)

    assert_response :success
  end

  test 'should redirect to reservations when edit invalid reservation' do
    get edit_reservation_url(id: 'invalid_id')

    assert_redirected_to reservations_url
    assert_equal 'Reservation not found', flash[:alert]
  end

  test 'should update reservation' do
    patch reservation_url(@reservation),
          params: {
            reservation: {
              currency:       @reservation.currency,
              departure_date: @reservation.departure_date,
              entry_date:     @reservation.entry_date,
              guest_email:    @reservation.guest_email,
              guest_name:     @reservation.guest_name,
              hotel_name:     @reservation.hotel_name,
              price:          @reservation.price
            }
          }

    assert_redirected_to reservation_url(@reservation)
  end

  test 'should redirect to reservations when update invalid reservation' do
    patch reservation_url(id: 'invalid_id')

    assert_redirected_to reservations_url
    assert_equal 'Reservation not found', flash[:alert]
  end

  test 'should update reservation from json' do
    patch reservation_url(@reservation),
          params: {
            reservation: {
              currency:       @reservation.currency,
              departure_date: @reservation.departure_date,
              entry_date:     @reservation.entry_date,
              guest_email:    @reservation.guest_email,
              guest_name:     @reservation.guest_name,
              hotel_name:     @reservation.hotel_name,
              price:          @reservation.price
            }
          },
          as: :json

    assert_response :success
  end

  test 'should get unprocessable entity when update reservation with invalid params from json' do
    patch reservation_url(@reservation), params: { reservation: { guest_email: 'invalid' } }, as: :json

    assert_response :unprocessable_entity
  end

  test 'should get not found when update invalid reservation from json' do
    patch reservation_url(id: 'invalid_id'), as: :json

    assert_response :not_found
  end

  test 'should destroy reservation' do
    assert_difference 'Reservation.count', -1 do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end

  test 'should redirect to reservations when destroy invalid reservation' do
    delete reservation_url(id: 'invalid_id')

    assert_redirected_to reservations_url
    assert_equal 'Reservation not found', flash[:alert]
  end

  test 'should destroy reservation from json' do
    assert_difference 'Reservation.count', -1 do
      delete reservation_url(@reservation), as: :json
    end

    assert_response :success
  end

  test 'should get not found when destroy invalid reservation from json' do
    delete reservation_url(id: 'invalid_id'), as: :json

    assert_response :not_found
  end
end
