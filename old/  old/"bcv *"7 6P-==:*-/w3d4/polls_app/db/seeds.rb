# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Lisza")
User.create(username: "Jose")
User.create(username: "AJ")
User.create(username: "Drew")
User.create(username: "Michael")

Poll.create(title: "Weather in SF", author_id: 1)

Question.create( question: "Do you like the weather here?", poll_id: 1)
Question.create( question: "What do you call the fog?",poll_id: 1)

AnswerChoice.create(answer: "Yes", question_id: 1)
AnswerChoice.create(answer: "No",question_id: 1)
AnswerChoice.create(answer: "Dunno",question_id: 1)

AnswerChoice.create(answer:"Fog",question_id: 2)
AnswerChoice.create(answer:"Carl",question_id: 2)
AnswerChoice.create(answer:"Huh?",question_id: 2)

Response.create(user_id: 2, answer_choice_id: 4)
Response.create(user_id: 2, answer_choice_id: 1)
Response.create(user_id: 3, answer_choice_id: 2)
Response.create(user_id: 3, answer_choice_id: 5)
