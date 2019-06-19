# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  question_id :bigint
#  answer      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user, presence: true
  validates :question, presence: true
  validates :answer, presence: true

  scope :are_answered, -> { where.not(answer: nil) }
  scope :are_true, -> { where(answer: true) }
  scope :are_false, -> { where(answer: false) }
  scope :for, -> (user) { where(user: user) }

  enum answer: { true: 1, false: 0 }, _prefix: :is
end
