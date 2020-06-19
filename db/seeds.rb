# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#TODO create seeds

10.times do
  u = User.create(:username => Faker::Internet.username, :email => Faker::Internet.email)
  u.posts.create(:content => Faker::Lorem.paragraph(sentence_count: rand(1..5)))
end