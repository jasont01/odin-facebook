# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUM_USERS = 30

NUM_USERS.times do
  #Users
  u = User.create(:name => Faker::Name.name,
                  :email => Faker::Internet.email,
                  :image => Faker::Avatar.image,
                  :password => Faker::Internet.password,
                  :skip_welcome_email => true)
  #Profiles
  u.profile.update(:birthday => Faker::Date.birthday,
                   :bio => Faker::Lorem.paragraph,
                   :relationship_status => ["Single", "Married", "In a Relationship"].sample,
                   :location => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
                   :hometown => "#{Faker::Address.city}, #{Faker::Address.state_abbr}")

  #Posts
  rand(0..10).times { u.posts.create(:content => Faker::Lorem.paragraph(sentence_count: rand(1..5))) }
end

#Friends
User.all.each do |user|
  rand(0..(NUM_USERS / 2)).times do #set max number of friends to 50% of total number of users
    loop do
      friend = User.all.sample
      if !user.friends.exists?(:friend_id => friend.id)
        user.friends.create(:friend_id => friend.id)
        friend.friends.create(:friend_id => user.id)
        break
      end
    end
  end
end

#Likes
Post.all.each do |post|
  rand(0..(post.author.friends.count / 2)).times do
    loop do
      uid = User.all.sample.id
      if !post.likes.exists?(:user_id => uid)
        post.likes.create(:user_id => uid)
        break
      end
    end
  end
end

#Comments
Post.all.each do |post|
  rand(0..(post.author.friends.count / 3)).times do
    loop do
      uid = User.all.sample.id
      if !post.comments.exists?(:author_id => uid)
        post.comments.create(:author_id => uid, :content => Faker::Lorem.sentence)
        break
      end
    end
  end
end

# Demo user - friends with all seeded users
demo = User.create(:name => "Demo User",
                   :email => "demo@email.com",
                   :password => "password",
                   :skip_welcome_email => true)

User.all.sample(NUM_USERS / 2).each do |user|
  next if user.id == demo.id
  user.friends.create(:friend_id => demo.id)
  demo.friends.create(:friend_id => user.id)
end