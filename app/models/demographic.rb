class Demographic < ApplicationRecord
  # Associations
  belongs_to :user

  # Standard Column Enums
  enum gender: { male: 0, female: 5, other_gender: 10 }, _prefix: :is
  enum ethnicity: {
    not_hispanic_latin_or_spanish: 0,
    mexican_mexican_american_chicano: 5,
    puerto_rican: 10,
    cuban: 15,
    other_ethnicity: 20,
  }, _prefix: :is
  enum race: {
    white: 0,
    black: 5,
    african_american: 10,
    american_indian: 15,
    alaska_native: 20,
    asian: 25,
    native_hawaiian: 30,
    other_pacific_islander: 35,
    other_race: 40,
  }, _prefix: :is

end
