# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
  first_name: 'g',
  last_name: 'Harmony',
  username: 'admin',
  password: '1234',
  password_confirmation: '1234',
  admin: true
)

User.create!(
  first_name: 'she',
  last_name: 'harmonie',
  username: 'monitor',
  password: '1234',
  password_confirmation: '1234',
  admin: false,
  monitor: true
)
