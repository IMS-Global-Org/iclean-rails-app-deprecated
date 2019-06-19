# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  street1          :string
#  street2          :string
#  city             :string
#  state            :string
#  zipcode          :integer
#  country          :string
#  addressable_type :string
#  addressable_id   :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address_type     :integer          default("home")
#

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
