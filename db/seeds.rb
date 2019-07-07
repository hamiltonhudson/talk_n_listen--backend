# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'dotenv'

DatabaseCleaner.clean_with(:truncation)


User.create!(username: "theeny", password: "beans")
User.create!(username: "jonvg", password: "darkness")
User.create!(username: "hammer", password: "howdy")
