class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :answer_type, presence: true
end
