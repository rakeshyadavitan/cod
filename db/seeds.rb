# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do 
  Movie.find_or_create_by(title: Faker::Book.title, plot: Faker::Book.genre)
  Season.find_or_create_by(title: Faker::Book.title, plot: Faker::Book.genre, number: Faker::Number.non_zero_digit)
  Episode.find_or_create_by(title: Faker::Book.title, plot: Faker::Book.genre, season_id: Faker::Number.within(range: 21..30), number: Faker::Number.non_zero_digit)
  User.find_or_create_by(email: Faker::Internet.email)
end
