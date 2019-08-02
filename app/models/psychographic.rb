class Psychographic < ApplicationRecord
  belongs_to :user
  has_many :exams, as: :examable, dependent: :delete_all

  validates :title, presence: true
end
