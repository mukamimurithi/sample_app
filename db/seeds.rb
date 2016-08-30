User.create!(name: "carol mukami",
             email: "carol@gmail.com",
             password: "carolmukami",
             password_confirmation: "carolmukami",
             admin: true,
             activated: true,
             activated_at: Time.zone.now )

99.times do |n|
name = Faker::Name.name

email = "carol-#{n+1}@gmail.com"
password = "password"
User.create!(name: name,
             email: email,
             password: password,
<<<<<<< HEAD
             password_confirmation: password,
             activated: true,
             activated_at: Time.zone.now )
=======
             password_confirmation: password)

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
>>>>>>> user_microposts
end
end