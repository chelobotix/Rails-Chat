require 'faker'

15.times do
  User.create!(username: Faker::Internet.username(specifier: 3..15), password: "1234")
end
