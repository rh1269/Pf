# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user2 = User.create!({
  username: "Shinji",
  password: "password1",
  password_confirmation: "password1",
  email: "shinji@pillowfort.io"
  })

user3 = User.create!({
  username: "Asuka",
  password: "password1",
  password_confirmation: "password1",
  email: "asuka@pillowfort.io"
  }

 user4 = User.create!({
  username: "Rei",
  password: "password1",
  password_confirmation: "password1",
  email: "rei@pillowfort.io"
  })

 post1 = Post.create!({
  user_id: user2.id, 
  content: "I must not run away, I must not run away, I must not run away",
  post_type: "text",
  rebloggable: true
  })

 post2 = Post.create!({
  user_id: user3.id,
  content: "I can live for myself and by myself!",
  post_type: "text",
  rebloggable: false
 })

 post3 = Post.create!({
  user_id: user4.id,
  content: "I am not a doll.",
  post_type: "text",
  rebloggable: true
 })

 reblog1 = Post.create!({
  user_id: user4.id,
  original_post_id: post1.id
  })

 post1.tag_list.add("angel attack, misato is weird", parse: true)
    post1.save

 Follow.create!(follower_id: user2.id, followed_id: user4.id, followed_type: "user")
 Follow.create!(follower_id: user4.id, followed_id: user2.id, followed_type: "user")
 Block.create!(blocked_id: user4.id, blocked_from_id: user3.id, blocked_from_type: "user")

 Community.create!({
  user_id: user3.id,
  name: "ExampleComm",
  description: "I was too lazy to come up with a more interesting community theme"
  })

 CommunityMembership.create!({
  
  })