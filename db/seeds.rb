# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

# Event.destroy_all
# Event.destroy_all
# User.destroy_all

puts "creating users"


User.create(
  email: "peter.p@gmail.com",
  password: "123456",
  first_name: "Peter" ,
  second_name: "Parker" ,
  phonenumber: 828085052,
  bio: "Hi there, avid board games player looking to meet up a few a few legends and put my skill to the test"
)

User.create(
  email: "menno@gmail.com",
  password: "123456",
  first_name: "Menno" ,
  second_name: "Bru" ,
  phonenumber: 864545052,
  bio: "Hello! I think I am the best Catan player in my area and I would like to put that to the test by player with other players"
)

User.create(
  email: "connor@gmail.com",
  password: "123456",
  first_name: "Connor" ,
  second_name: "Mac" ,
  phonenumber: 828085052,
  bio: "Love board games, please let me play with you"
)

User.create(
  email: "sally@gmail.com",
  password: "123456",
  first_name: "Sally" ,
  second_name: "Ali" ,
  phonenumber: 160160515,
  bio: "Just a fun guy looking for a board game"
)


puts "#{User.count} users created"


puts "creating games"


Game.create(
  name: "Catan",
  desciption: "Catan is a board game for two to four players in which you compete to gather resources and build the biggest settlements on the fictional island of Catan. It takes approximately one hour to play.",
  first_place_points: 300,
  second_place_points: 150,
  losing_points: -100,
)

Game.create(
  name: "Risk",
  desciption: "In the Risk game, the goal is simple, players aim to conquer their enemies, territories by building an army, moving their troops in, and engaging in battle. Depending on the role of the dice, a player will either defeat the enemy or be defeated." ,
  first_place_points: 300,
  second_place_points: 150 ,
  losing_points: -100,
)

Game.create(
  name: "Secret Hitler",
  desciption: "Secret Hitler is a dramatic game of political intrigue and betrayal set in 1930's Germany. Players are secretly divided into two teams - liberals and fascists. Known only to each other, the fascists coordinate to sow distrust and install their cold-blooded leader.",
  first_place_points: 300,
  second_place_points: 150 ,
  losing_points: -100,
)

Game.create(
  name: "Code Names",
  desciption: "Two teams compete by each having a 'spymaster' give one-word clues that can point to multiple words on the board. The other players on the team attempt to guess their team's words while avoiding the words of the other team.",
  first_place_points: 300,
  second_place_points: 150 ,
  losing_points: -100,
)

Game.create(
  name: "30 Seconds",
  desciption: "30 Seconds is a fast-paced general knowledge game. Players generally play in teams of two or four. One player must guess a word from their teammate's explanation, much like Charades, with the aim to guess as many possible answers in 30 seconds.",
  first_place_points: 300,
  second_place_points: 150 ,
  losing_points: -100,
)


puts "#{Game.count} games created"

puts "Creating events"

# User.all.each do |user|
    # file = URI.open("https://www.mydeskhub.com/wp-content/uploads/2017/06/Mob-H-27-scaled.jpg")
    eventone = Event.new(
      date: DateTime.now,
      user_id: User.all.sample.id,
      name: "Girls night out",
      game_id: Game.all.sample.id,
      address: "Calle Bailen 11, Bajos 08010 Barcelona",
      description: "Please bring some wine",
    )
    # eventone.image.attach(io: file, filename: 'Eventone.jpg', content_type: 'image/jpg')
    eventone.save!

    eventtwo = Event.new(
      date: DateTime.now,
      user_id: User.all.sample.id,
      name: "Big games night",
      game_id: Game.all.sample.id,
      address: "4, Southern Right Circle, Cape Town",
      description: "A lovely night with some friends",
    )
    eventtwo.save!

    eventthree = Event.new(
      date: DateTime.new(),
      user_id: User.all.sample.id,
      name: "RISK NIGHT BABY",
      game_id: Game.all.sample.id,
      address: "41, Skilpadvlei Road, Cape Town",
      description: "Please bring some wine",
    )
    eventthree.save!

    eventfour = Event.new(
      date: DateTime.new(),
      user_id: User.all.sample.id,
      name: "Girls night out",
      game_id: Game.all.sample.id,
      address: " 38, De la Haye Avenue, Cape Town",
      description: "Should be fun",
    )
    eventfour.save!

    eventfive = Event.new(
      date: DateTime.new(),
      user_id: User.all.sample.id,
      name: "Secret H",
      game_id: Game.all.sample.id,
      address: "15, Willow Way, Cape Town",
      description: "Please bring some wine",
    )
    eventfive.save!

    eventsix = Event.new(
      date: DateTime.new(),
      user_id: User.all.sample.id,
      name: "Thursday catan",
      game_id: Game.all.sample.id,
      address: "28, Klinker Street, Cape Town",
      description: "Please be serious about gaming",
    )
    eventsix.save!

    eventseven = Event.new(
      date: DateTime.now,
      user_id: User.all.sample.id,
      name: "Poker night",
      game_id: Game.all.sample.id,
      address: "17, Louis Botha Avenue, Cape Town",
      description: "BE the game, live the game",
    )
    eventseven.save!

    eventeight = Event.new(
      date: DateTime.new(),
      user_id: User.all.sample.id,
      name: "Champs only",
      game_id: Game.all.sample.id,
      address: ": 27, Tradewinds Circle, Cape Town",
      description: "Please bring some wine",
    )
    eventeight.save!

    eventnine = Event.new(
      date: DateTime.now - 1.weeks,
      user_id: User.all.sample.id,
      name: "Legends only",
      game_id: Game.all.sample.id,
      address: "6, Eksteen Street, Cape Town",
      description: "Just some good mates looking to have a lekker time",
    )
    eventnine.save!

puts "#{Event.count} Events created"
puts "creating players"

10.times do
  player = Player.new(
    status: rand(0...3),
    event_id: Event.all.sample.id,
    user_id: User.all.sample.id
  )
  # Event.Player = Player.all.sample
  # player.user = User.all.sample
  player.save!
end

puts "#{Player.count} players created"

rating = UserRating.new(
  game_id: Game.all.sample.id,
  user_id: User.all.sample.id,
  rating: rand(1..5)
)
rating.save!
puts "#{UserRating.count} ratings created"
puts "Your seeds are now ready for action"