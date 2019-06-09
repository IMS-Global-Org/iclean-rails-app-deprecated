class Psychographic < ApplicationRecord
  belongs_to :user
  has_many :questions, as: :questionable, dependent: :delete_all

  validates :title, presence: true
end
