class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  enum address_type: {
    home: 0,
    work: 5,
    other: 10,
  }, _prefix: :is

  validates :street1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :country, presence: true
  validates :address_type, presence: true
end
