# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

puts "deleting users"

Player.destroy_all
Event.destroy_all
UserRating.destroy_all
User.destroy_all
Game.destroy_all

puts "creating games"

Game.create(
  name: "Catan",
  desciption: "Catan is a board game for two to four players in which you compete to gather resources and build the biggest settlements on the fictional island of Catan. It takes approximately one hour to play.",
  first_place_points: 300,
  second_place_points: 150,
  losing_points: -100,
  photo: "Catan.png"
)

Game.create(
  name: "Risk",
  desciption: "In the Risk game, the goal is simple, players aim to conquer their enemies, territories by building an army, moving their troops in, and engaging in battle. Depending on the role of the dice, a player will either defeat the enemy or be defeated." ,
  first_place_points: 300,
  second_place_points: 150,
  losing_points: -100,
  photo: "risk.webp"
)

Game.create(
  name: "Secret Hitler",
  desciption: "Secret Hitler is a dramatic game of political intrigue and betrayal set in 1930's Germany. Players are secretly divided into two teams - liberals and fascists. Known only to each other, the fascists coordinate to sow distrust and install their cold-blooded leader.",
  first_place_points: 300,
  second_place_points: 150 ,
  losing_points: -100,
  photo: "secret hitler.webp"
)

Game.create(
  name: "Code Names",
  desciption: "Two teams compete by each having a 'spymaster' give one-word clues that can point to multiple words on the board. The other players on the team attempt to guess their team's words while avoiding the words of the other team.",
  first_place_points: 300,
  second_place_points: 150 ,
  losing_points: -100,
  photo: "code_names.jpg"
)

Game.create(
  name: "30 Seconds",
  desciption: "30 Seconds is a fast-paced general knowledge game. Players generally play in teams of two or four. One player must guess a word from their teammate's explanation, much like Charades, with the aim to guess as many possible answers in 30 seconds.",
  first_place_points: 300,
  second_place_points: 150 ,
  losing_points: -100,
  photo: "30-seconds.jpg"
)

Game.create(
  name: "Perudo",
  desciption: "Perudo can be played with two or more players. Each player starts with a cup and five dice. Players throw one die to see who starts. To begin, each player simultaneously shakes the cup and then upends it onto the table using it to conceal their dice from other players.",
  first_place_points: 300,
  second_place_points: 150 ,
  losing_points: -100,
  photo: "perudo.jpg"
)


puts "#{Game.count} games created"


puts "creating users"


User.create(
  email: "peter.p@gmail.com",
  password: "123456",
  first_name: "Peter",
  second_name: "Parker",
  phonenumber: 828085052,
  bio: "Hi there, avid board games player looking to meet up a few a few legends and put my skill to the test",
  username: "spiderman"
)

User.create(
  email: "menno@gmail.com",
  password: "123456",
  first_name: "Menno" ,
  second_name: "Bru" ,
  phonenumber: 864545052,
  bio: "Hello! I think I am the best Catan player in my area and I would like to put that to the test by player with other players",
  username: "ziod"
)

User.create(
  email: "connor@gmail.com",
  password: "123456",
  first_name: "Connor" ,
  second_name: "Mac" ,
  phonenumber: 828085052,
  bio: "Love board games, please let me play with you",
  username: "CONNYBOY"
)

User.create(
  email: "sally@gmail.com",
  password: "123456",
  first_name: "Sally" ,
  second_name: "Ali" ,
  phonenumber: 160160515,
  bio: "Just a fun guy looking for a board game",
  username: "Sexy sally"
)

User.create(
  email: "dom@gmail.com",
  password: "123456",
  first_name: "Dom" ,
  second_name: "Welly" ,
  phonenumber: 160160515,
  bio: "We love to game with Dommo",
  username: "DOMMY"
)

User.create(
  email: "lion@gmail.com",
  password: "123456",
  first_name: "Lionel" ,
  second_name: "Messi" ,
  phonenumber: 160160515,
  bio: "So good to be alive , lets goo!",
  username: "THE GOAT"
)

User.create(
  email: "kelly@gmail.com",
  password: "123456",
  first_name: "Kelly" ,
  second_name: "Parker" ,
  phonenumber: 160160515,
  bio: "I enjoy playing games with my mates ",
  username: "KELLYGIRL1"
)

puts "#{User.count} users created"

puts "Creating events"

 User.all.each do |user|

    file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1d-IOy7_gdopxNUgDA1bWajBsoE5KqMKNZg&usqp=CAU")
    eventone = Event.new(
      date: DateTime.now + 10.days,
      user_id: User.all.sample.id,
      name: "Girls night out",
      game_id: Game.all.sample.id,
      address: "69, Uys Krige Drive",
      description: "Please bring some wine",
      capacity: rand(3..8)

    )
    eventone.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventone.save!

    file = URI.open("https://tinyurl.com/yk6byn9f")
    eventtwo = Event.new(
      date: DateTime.now + 3.days,
      user_id: User.all.sample.id,
      name: "Big games night",
      game_id: Game.all.sample.id,
      address: "4, Southern Right Circle, Cape Town",
      description: "A lovely night with some friends",
      capacity: rand(3..8)

    )
    eventtwo.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventtwo.save!

    file = URI.open("https://www.google.com/imgres?imgurl=https%3A%2F%2Fcb.scene7.com%2Fis%2Fimage%2FCrate%2FG7655_PicnicTableInBagV2SHS18%2F%24web_pdp_main_carousel_zoom_med%24%2F220913134827%2Foutdoor-entertaining.jpg&imgrefurl=https%3A%2F%2Fwww.crateandbarrel.com%2Foutdoor-table-in-a-bag%2Fs670848&tbnid=PnUz4MbQQZmL3M&vet=12ahUKEwje4c3Dhav7AhU8g84BHS9mDhYQMygOegUIARCRAg..i&docid=8QB4b6T8Ob8VLM&w=1195&h=1195&q=beach%20table&ved=2ahUKEwje4c3Dhav7AhU8g84BHS9mDhYQMygOegUIARCRAg")
    eventthree = Event.new(
      date: DateTime.now + 3.days,
      user_id: User.all.sample.id,
      name: "RISK NIGHT BABY",
      game_id: Game.all.sample.id,
      address: "41, Skilpadvlei Road, Cape Town",
      description: "You love to see it, couple mates having a good time",
      capacity: 10

    )
    eventthree.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventthree.save!

    file = URI.open("https://tinyurl.com/4yrdvt4b")
    eventfour = Event.new(
      date: DateTime.now + 1.days,
      user_id: User.all.sample.id,
      name: "Girls night out",
      game_id: Game.all.sample.id,
      address: " 38, De la Haye Avenue, Cape Town",
      description: "Should be fun",
      capacity: rand(3..8)

    )
    eventfour.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventfour.save!

    file = URI.open("https://tinyurl.com/4yrdvt4b")
    eventfive = Event.new(
      date: DateTime.now + 7.days,
      user_id: User.all.sample.id,
      name: "Secret H",
      game_id: Game.all.sample.id,
      address: "15, Willow Way, Cape Town",
      description: "Excited to meet some new people, but looking for serrious gamers please",
      capacity: rand(3..8)


    )
    eventfive.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventfive.save!

    file = URI.open("https://tinyurl.com/4yrdvt4b")
    eventsix = Event.new(
      date: DateTime.now + 3.days,
      user_id: User.all.sample.id,
      name: "Thursday catan",
      game_id: Game.all.sample.id,
      address: "28, Klinker Street, Cape Town",
      description: "Please be serious about gaming",
      capacity: rand(3..8)

    )
    eventsix.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventsix.save!

    file = URI.open("https://tinyurl.com/ypjmwwx6")
    eventseven = Event.new(
      date: DateTime.now + 2.days,
      user_id: User.all.sample.id,
      name: "Poker night",
      game_id: Game.all.sample.id,
      address: "17, Louis Botha Avenue, Cape Town",
      description: "BE the game, live the game",
      capacity: rand(3..8)

    )
    eventseven.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventseven.save!

    file = URI.open("https://tinyurl.com/3ddypsmz")
    eventeight = Event.new(
      date: DateTime.now + 2.weeks,
      user_id: User.all.sample.id,
      name: "Champs only",
      game_id: Game.all.sample.id,
      address: ": 27, Tradewinds Circle, Cape Town",
      description: "Please bring some wine and snacks, I do not supply that.Ampped!",
      capacity: rand(3..8)

    )
    eventeight.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventeight.save!

    file = URI.open("https://tinyurl.com/3ddypsmz")
    eventnine = Event.new(
      date: DateTime.now + 67.weeks,
      user_id: User.all.sample.id,
      name: "Boardgames are for sissies",
      game_id: Game.all.sample.id,
      address: "5, Links Drive",
      description: "Just some good mates looking to have a lekker time",
      capacity: rand(3..8)

    )
    eventnine.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventnine.save!

    file = URI.open("https://tinyurl.com/3ddypsmz")
    eventten = Event.new(
      date: DateTime.now + 15.weeks,
      user_id: User.all.sample.id,
      name: "SO amped for this guys",
      game_id: Game.all.sample.id,
      address: "15, Waboomskloof",
      description: "Lets be respectful of our opponents as well as the game we are playing"
      capacity: rand(3..8)

    )
    eventten.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventten.save!

  end

    file = URI.open("https://tinyurl.com/3ddypsmz")
    event11 = Event.new(
      date: DateTime.now + 10.weeks,
      user_id: User.all.sample.id,
      name: "Legends only",
      game_id: Game.all.sample.id,
      address: "Pakalolo Table View, 14, Beach Boulevard",
      description: "Table View loving",
      capacity: rand(3..8)

    )
    event11.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    event11.save!

    file = URI.open("https://tinyurl.com/3ddypsmz")
    event12 = Event.new(
      date: DateTime.now + 5.weeks,
      user_id: User.all.sample.id,
      name: "Please bring dice",
      game_id: Game.all.sample.id,
      address: "15, B. Molokoane Road",
      description: "Molo road with the lads!",
      capacity: rand(3..8)

    )
    event12.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    event12.save!

    file = URI.open("https://hw.menardc.com/main/items/media/WOODA004/ProductLarge/WI_P_SC_5PCActionDiningSet_MAIN.jpg")
    event13 = Event.new(
      date: DateTime.now + 7.days,
      user_id: User.all.sample.id,
      name: "Lets have some fun ",
      game_id: Game.all.sample.id,
      address: "54, Walmer Road",
      description: "Good clean fun please"
      capacity: rand(3..8)

    )
    event13.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    event13.save!

    file = URI.open("https://media.gardenista.com/wp-content/uploads/2015/04/fields/cropped-crate-and-barrel-savanna-cane-rug.jpg")
    event14 = Event.new(
      date: DateTime.now + 12.days,
      user_id: User.all.sample.id,
      name: "Legends only",
      game_id: Game.all.sample.id,
      address: "8, Braambos Lane",
      description: "Interesting how cream always rises to the top",
      capacity: rand(3..8)

    )
    event14.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    event14.save!

    file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLxd2oN4B7t8dwYW_ABMN-KoSTXySptCWi8owbFIKrxO2_U54EacOh_F-qgGhhqEcH8FQ&usqp=CAU")
    event15 = Event.new(
      date: DateTime.now + 25.days,
      user_id: User.all.sample.id,
      name: "We love games",
      game_id: Game.all.sample.id,
      address: "52, Blue Valley Avenue",
      description: "Just some good mates looking to have a lekker time",
      capacity: rand(3..8)

    )
    event15.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    event15.save!

    file = URI.open("https://tinyurl.com/3ddypsmz")
    event16 = Event.new(
      date: DateTime.now + 16.days,
      user_id: User.all.sample.id,
      name: "Legends only",
      game_id: Game.all.sample.id,
      address: "34, Shelduck Crescent",
      description: "If someone would like to stay after I am happy to play some Perudo after the game",
      capacity: rand(3..8)

    )
    event16.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    event16.save!

    file = URI.open("https://i.ebayimg.com/images/g/niwAAOSw481gZtpD/s-l300.jpg")
    event17 = Event.new(
      date: DateTime.now + 7.weeks,
      user_id: User.all.sample.id,
      name: "Legends only",
      game_id: Game.all.sample.id,
      address: "Witzands Aquifer Nature Reserve, 1, Dassenberg Drive",
      description: "I love games hey, I think I could be addicted to Perudo, please help me but also play with me",
      capacity: rand(3..8)

    )
    event17.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    event17.save!

puts "#{Event.count} Events created"
puts "creating players"

20.times do
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
  rating: rand(1000..2000)
)
rating.save!
puts "#{UserRating.count} ratings created"
puts "Your seeds are now ready for action"
