# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
User.destroy_all

puts 'Creating users...'
user_attributes = [
  {
    email: "lola@gh.com",
    first_name: "Louis",
    last_name:      "Doba",
    description:  "I'm a young cook living in Barcelona. I'm from France and I love jamon.",
  },

   {
    email: "charlie@sweeden.se",
    first_name: "Charlie",
    last_name:      "Swesson",
    description:  "Young, cool, long hair, nice bear. I'm vegan but I would eat Gina",
  },

    {
    email: "francesca.dicenta@f.fr",
    first_name: "francesca",
    last_name:      "Dicenta",
    description:  "Italiano de Verona!!"
  },
    {
    email: "vikariusu@gh.com",
    first_name: "vikariusu",
    last_name:      "Polashka",
    description:  "I live in Barcelona for the next two months"
  },
    {
    email: "parma@gui.com",
    first_name: "Patrick",
    last_name:      "Wilson",
    description:  "Hey lads, I come from Ireland!!"
  },
    {
    email: "super@gh.com",
    first_name: "Sabrina",
    last_name:      "Sapa",
    description:  "I'm super Sabrina"
  },
    {
    email: "orange@iui.com",
    first_name: "Orange",
    last_name:      "Tree",
    description:  "Can't move as I'm a tree."
  },

]
user_attributes.each do |user|
  User.create!(user)
end

puts 'Finished!'

puts 'Cleaning database...'
Event.destroy_all

puts 'Creating events...'
event_attributes = [
  {
    name: "Chatbot in an hour",
    event_time: "2017-08-03 09:30:45",
    description: "Bots are the apps. Really? Come and learn more",
    location:      "112 rue du Fg St-Honoré 75008 Paris",
    category:  "tech",
    user_id: User.first.id,
  },
  {
    name: "Cooking with Wlad",
    event_time:"2017-08-15 09:30:45",
    description: "Learn how to cook a tartiflette",
    location:      "112 rue Barbet 75007 Paris",
    category:  "food",
    user_id: User.first.id,
  },

  {
    name: "Dreaming together",
    event_time:"2017-08-20 09:30:45",
    description: "Fed up of the world as it is? Come and dream with us",
    location:      "Park of Mont Serat",
    category:  "WTF",
    user_id: User.first.id,
  },

 {
    name: "Technolover",
    event_time:"2017-08-01 09:30:45",
    description: "Hard Techno",
    location:      "Pacha",
    category:  "music",
    user_id: User.first.id,
  },


 {
    name: "Wine tasting",
    event_time:"2017-08-05 09:30:45",
    description: "Try the best of Rioja",
    location:      "Bodega Ginoa",
    category:  "food",
    user_id: User.first.id,
  },

 {
    name: "Paint my city",
    event_time: "2017-08-08 09:30:45",
    description: "Paint your disctrict with the collective paint my city",
    location:      "Gracia metro",
    category:  "art",
    user_id: User.first.id,
  },


]

event_attributes.each do  |event|
  Event.create!(event)
end

puts 'Finished!'
