json.extract! reservation, :hotel_name, :price, :currency, :entry_date, :departure_date, :guest_name, :guest_email, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
