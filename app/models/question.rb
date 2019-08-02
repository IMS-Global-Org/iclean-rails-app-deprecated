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

class Question < ApplicationRecord
  belongs_to :questionable, polymorphic: true
  has_many :answers, dependent: :destroy

  validates :text, presence: true
  validates :questionable, presence: true
end
