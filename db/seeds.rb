User.create!(name: "carol mukami",
             email: "carol@gmail.com",
             password: "carolmukami",
             password_confirmation: "carolmukami",
             admin: true )

99.times do |n|
name = Faker::Name.name

email = "carol-#{n+1}@gmail.com"
password = "password"
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password)

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
end