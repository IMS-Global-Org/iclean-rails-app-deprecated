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

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
