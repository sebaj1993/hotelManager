FactoryBot.define do
  factory :reservation do
    hotel_name     { 'First Reservation' }
    price          { 100.55 }
    currency       { 'USD' }
    entry_date     { Date.new }
    departure_date { Date.new + 2.days }
    guest_name     { 'Sebastian Jaliff' }
    guest_email    { 'seba@gmail.com' }
  end
end
