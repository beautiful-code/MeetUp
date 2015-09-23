# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.create(email: "gouthamj99@gmail.com", password: "test1234", password_confirmation: "test1234")
User.create(email: "gj@abcd.com", password: "test1234", password_confirmation: "test1234")

User.first.owned_groups.create(name:"HTC Club")
User.first.owned_groups.create(name:"Motorola Club")
User.last.owned_groups.create(name:"Economics Club")
User.last.owned_groups.create(name:"Linux Club")

User.first.owned_groups.first.events.create(name:"Bhongir Trekking", start_at: "2015-09-22 13:02:48", end_at: "2015-09-22 13:02:48", user_id: 1)
User.first.owned_groups.first.events.create(name:"Wildlife Safari", start_at: "2015-09-22 13:02:48", end_at: "2015-09-22 13:02:48", user_id: 1)
User.last.owned_groups.last.events.create(name:"GRUB vs LILO", start_at: "2015-09-22 13:02:48", end_at: "2015-09-22 13:02:48", user_id: 2)


