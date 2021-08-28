# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
events = [
  { time: Time.now, description: "Seeding the Database" },
  { time: Time.now - 1.day, description: "Ruby Mixer" },
  { time: Time.now + 1.day, description: "Job Fair" },
  { time: Time.now + 2.day, description: "Tech Startup Happy Hour" }
]

users = [
  { first_name: "Sam", last_name: "Copeland", email: "sam.copeland@gmail.com" },
  { first_name: "John", last_name: "Doe", email: "john.doe@juno.com" },
  { first_name: "Chronically", last_name: "Absent", email: "absent@hotmail.com" },
  { first_name: "Jeff", last_name: "Bezos", email: "jeff@amazon.com" }
]

invites = [
  {user_id: 1, event_id: 1, response: 'accepted', attended: true  },
  {user_id: 1, event_id: 2, response: 'declined', attended: false },
  {user_id: 1, event_id: 3, response: 'ignored',  attended: true  },
  {user_id: 1, event_id: 4, response: 'accepted', attended: true  },
  {user_id: 2, event_id: 1, response: 'accepted', attended: false },
  {user_id: 2, event_id: 2, response: 'accepted', attended: true  },
  {user_id: 2, event_id: 3, response: 'ignored',  attended: false },
  {user_id: 2, event_id: 4, response: 'declined', attended: true  },
  {user_id: 3, event_id: 1, response: 'declined', attended: false },
  {user_id: 3, event_id: 2, response: 'accepted', attended: false },
  {user_id: 3, event_id: 3, response: 'ignored' , attended: false },
  {user_id: 3, event_id: 4, response: 'accepted', attended: false },
  {user_id: 4, event_id: 1, response: 'accepted', attended: true  },
  {user_id: 4, event_id: 2, response: 'accepted', attended: true  },
  {user_id: 4, event_id: 3, response: 'accepted', attended: true  },
  {user_id: 4, event_id: 4, response: 'accepted', attended: true  },
]

events.each do |event|
  Event.create(
    time: event[:time],
    description: event[:description]
  )
end

users.each do |user|
  User.create(
    first_name: user[:first_name],
    last_name: user[:last_name],
    email: user[:email]
  )
end

invites.each do |invite|
  Invite.create(
    user_id: invite[:user_id],
    event_id: invite[:event_id],
    response: invite[:response],
    attended: invite[:attended]
  )
end
