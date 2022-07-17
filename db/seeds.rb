# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
backend = Category.create(title: 'Backend')
frontend = Category.create(title: 'Frontend')

ryan = User.create(name: 'Ryan', email: 'ryangosling@gmail.com', password: 'DriVe147')
tom = User.create(name: 'Tom', email: 'tomhardy@gmail.com', password: 'BronSon62')

ruby = Test.create(title: 'Ruby', level: 1, category_id: backend.id)
javascript = Test.create(title: 'JavaScript', level: 2, category_id: frontend.id)
html = Test.create(title: 'HTML', level: 1, category_id: frontend.id)

question_1 = Question.create(body: 'Как называется самый популярный фреймворк языка Ruby для веба?', test_id: ruby.id)
question_2 = Question.create(body: 'Какие циклы есть в языке JavaScript?', test_id: javascript.id)
question_3 = Question.create(body: 'С помощью какого свойства изменяется ширина таблицы?', test_id: html.id)

answer_1 = Answer.create(body: 'Rails', correct: true, question_id: question_1.id)
answer_2 = Answer.create(body: 'Ruby Web', question_id: question_1.id)
answer_3 = Answer.create(body: 'for, while, do while', correct: true, question_id: question_2)
answer_4 = Answer.create(body: 'for, forMap, foreach, while, do while', question_id: question_2)
answer_5 = Answer.create(body: 'width', correct: true, question_id: question_3)
answer_6 = Answer.create(body: 'length', question_id: question_3)

finished_1 = FinishedTest.create(user_id: ryan.id, test_id: ruby.id)
finished_2 = FinishedTest.create(user_id: tom.id, test_id: html.id)