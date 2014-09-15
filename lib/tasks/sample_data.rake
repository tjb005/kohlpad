namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Diana Dela Torre",
                       email:    "rix_237@hotmail.com",
                       password: "abcd1985",
                       password_confirmation: "abcd1985",
                       admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    ethnicity = "black"
    skin_type = "red"
    complexion = "brown"
    brands = "MAC"
    about = "I like makeup"
    website = "www.test.com"
    location = "location"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password,
                 ethnicity: ethnicity,
                 skin_type: skin_type,
                 complexion: complexion,
                 brands: brands,
                 about: about,
                 website: website,
                 location: location)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end