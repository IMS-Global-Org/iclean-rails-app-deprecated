# == Schema Information
#
# Table name: demographics
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  age        :integer
#  gender     :integer
#  ethnicity  :integer
#  race       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Demographic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
