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

ryan = User.create(first_name: 'Ryan', last_name: 'Gosling', email: 'ryangosling@gmail.com', password: 'DriVe147')
tom = User.create(first_name: 'Tom', last_name: 'Hardy', email: 'tomhardy@gmail.com', password: 'BronSon62')

ruby = Test.create(title: 'Ruby', level: 1, category_id: backend.id, author_id: tom.id)
javascript = Test.create(title: 'JavaScript', level: 2, category_id: frontend.id, author_id: tom.id)
html = Test.create(title: 'HTML', level: 1, category_id: frontend.id, author_id: ryan.id)

question_1 = Question.create(body: 'Как называется самый популярный фреймворк языка Ruby для веба?', test_id: ruby.id)
question_2 = Question.create(body: 'Какие циклы есть в языке JavaScript?', test_id: javascript.id)
question_3 = Question.create(body: 'С помощью какого свойства изменяется ширина таблицы?', test_id: html.id)

answer_1 = Answer.create(body: 'Rails', correct: true, question_id: question_1.id)
answer_2 = Answer.create(body: 'Ruby Web', question_id: question_1.id)
answer_3 = Answer.create(body: 'for, while, do while', correct: true, question_id: question_2.id)
answer_4 = Answer.create(body: 'for, forMap, foreach, while, do while', question_id: question_2.id)
answer_5 = Answer.create(body: 'width', correct: true, question_id: question_3.id)
answer_6 = Answer.create(body: 'length', question_id: question_3.id)
