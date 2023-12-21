require 'faker'

# Users

# Admin user:
admin = User.create!(username: 'marce', password: "1234")
Message.create!(body: 'Everybody calm down please', user_id: admin.id)

15.times do
  user = User.new(username: Faker::Games::StreetFighter.character, password: "1234")
  if user.valid?
    user.save
  end
end

# Comments
15.times do
  control = true
  while control
    id = rand(1...User.last.id)
    user = User.find(id)
    control = false if !user.nil? && id != 1
  end

  Message.create!(body: Faker::Games::StreetFighter.quote, user_id: id)
end
