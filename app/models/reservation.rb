class Reservation
  include Mongoid::Document
  include Mongoid::Timestamps

  CURRENCIES = %w[USD EUR].freeze

  field :hotel_name,     type: String
  field :price,          type: Float
  field :currency,       type: String
  field :entry_date,     type: Date
  field :departure_date, type: Date
  field :guest_name,     type: String
  field :guest_email,    type: String

  validates :price, numericality: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :currency, inclusion: { in: CURRENCIES }
  validates :guest_email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :departure_date, comparison: { greater_than: :entry_date }
end
