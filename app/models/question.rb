class Question < ApplicationRecord
  belongs_to :questionable, polymorphic: true
  has_many :answers, as: :answerable, dependent: :delete_all

  validates :text, presence: true
  validates :question_type, presence: true

  enum question_type: {
    input: 0,
    textarea: 5,
    checkbox: 10,
    radio: 15,
    select: 20,
    number: 25,
    yes_no: 30,
  }, _prefix: :is
end
