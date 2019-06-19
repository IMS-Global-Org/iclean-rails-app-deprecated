# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Development Environment User
User.destroy_all
user = User.create(
  email: 'iclean.dev@iclean.com',
  password: 'password',
  password_confirmation: 'password',
)
user.update(role: 'admin')


# Seed Demographic info for User
Demographic.destroy_all
Demographic.create(age: 44, user: user, gender: 'male', ethnicity: 'other_ethnicity', race: 'white')


# Seed Exam, Questions and Answers
Exam.destroy_all
Question.destroy_all
Answer.destroy_all

(0..2).each do
  # Create a set of test/quizes 
  exam = Exam.create({
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(6),
    icon: 'exam'
  })
  # seed questions for exam
  (0..5).each do
    question = exam.questions.create({
      text: Faker::Lorem.sentence,
      hint: Faker::Lorem.sentence,
    })
    # seed answers for question
    Answer.create(
      user: user,
      question: question,
      answer: Answer.answers.keys.sample
    )
  end
end
