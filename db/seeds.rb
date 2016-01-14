# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!({
  username: "Anakin"
  password: "password1"
  password_confirmation: "password1"
  email: "anakin@pillowfort.io"
  })

user2 = User.create!({
  username: "ObiWan"
  password: "password1"
  password_confirmation: "password1"
  email: "obiwan@pillowfort.io"
  })

user3 = User.create!({
  username: "luke-skywalker"
  password: "password1"
  password_confirmation: "password1"
  email: "luke@pillowfort.io"
  })