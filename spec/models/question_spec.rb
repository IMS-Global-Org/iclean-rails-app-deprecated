# == Schema Information
#
# Table name: questions
#
#  id                :bigint           not null, primary key
#  text              :string
#  hint              :string
#  exam_id           :bigint
#  questionable_type :string
#  questionable_id   :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
