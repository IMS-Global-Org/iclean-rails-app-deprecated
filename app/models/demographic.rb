class Demographic < ApplicationRecord
  # Associations
  belongs_to :user

  # Standard Column Enums
  enum gender: { male: 0, female: 5, other: 10 }, _prefix: :is
  enum ethnicity: {}, _prefix: :is
  enum race: {
    white: 0,
    black: 5,
    african_american: 10,
    american_indian: 15,
    alaska_native: 20,
    asian: 25,
    native_hawaiian: 30,
    other_pacific_islander: 35,
    }, _prefix: :is

  # Validations
  validates :age
  validates :gender
  validates :ethnicity
  validates :race
end
