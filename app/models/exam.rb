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

class Exam < ApplicationRecord
  has_many :questions, as: :questionable, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :icon, presence: true
end
