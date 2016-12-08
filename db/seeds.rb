User.create!(firstname: "User", lastname: "Lastname", password: "ddd001", password_confirmation: "ddd001", website: "www.example.com")

99.times do |n|
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  password = "password"
  website = "www.example-#{n+1}.com"
  User.create!(firstname: firstname, lastname: lastname, password: password, password_confirmation: password, website: website)
end


# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
