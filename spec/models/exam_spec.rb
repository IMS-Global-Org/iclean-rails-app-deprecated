# == Schema Information
#
# Table name: exams
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  icon        :string(20)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Exam, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
