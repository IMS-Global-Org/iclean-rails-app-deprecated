# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.first
Psychographic.destroy_all


# load psychographic test strings
(0..5).to_a.each do
  # Create a set of test/quizes 
  psycho = user.psychographics.create({
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(6)
  })
  # create the actual test/quiz types and descriptions
  (0..10).to_a.each do
    psycho.questions.create({
      text: Faker::Lorem.sentence,
      hint: Faker::Lorem.sentence,
      question_type: Question.question_types.keys.sample,
    })
  end
end
