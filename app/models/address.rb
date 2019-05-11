class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  enum address_type: {
    home: 0,
    work: 5,
    other: 10,
  }, _prefix: :is
end
