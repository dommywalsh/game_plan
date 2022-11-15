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


file = URI.open("https://images.unsplash.com/photo-1505925456693-124134d66749?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGV0ZXIlMjBwYXJrZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60")
user1 = User.new(
  email: "peter.p@gmail.com",
  password: "123456",
  first_name: "Peter",
  second_name: "Parker",
  phonenumber: 828085052,
  bio: "Hi there, avid board games player looking to meet up a few a few legends and put my skill to the test",
  username: "spiderman"
)
user1.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
user1.save

file = URI.open("https://images.unsplash.com/photo-1601814933824-fd0b574dd592?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1712&q=80")
user2 = User.new(
  email: "menno@gmail.com",
  password: "123456",
  first_name: "Menno" ,
  second_name: "Bru" ,
  phonenumber: 864545052,
  bio: "Hello! I think I am the best Catan player in my area and I would like to put that to the test by player with other players",
  username: "ziod"
)
  user2.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user2.save

  file = URI.open("https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZSUyMHBpY3R1cmVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
  user3 = User.new(
    email: "connor@gmail.com",
    password: "123456",
    first_name: "Connor" ,
    second_name: "Mac" ,
    phonenumber: 828085052,
    bio: "Love board games, please let me play with you",
    username: "CONNYBOY"
  )
user3.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user3.save

  file = URI.open("https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
user4 = User.new(
  email: "sally@gmail.com",
  password: "123456",
  first_name: "Sally",
  second_name: "Ali",
  phonenumber: 160160515,
  bio: "Just a fun guy looking for a board game",
  username: "Sexy sally"
)
user4.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user4.save

  file = URI.open("https://avatars.githubusercontent.com/u/111738297?v=4")
  user5 = User.new(
  email: "dom@gmail.com",
  password: "123456",
  first_name: "Dom",
  second_name: "Welly",
  phonenumber: 160160515,
  bio: "We love to game with Dommo",
  username: "DOMMY"
)
user5.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user5.save

  file = URI.open("https://tse1.mm.bing.net/th?id=OIP.jKHBRVWDytTl9XLqRRQ7kAHaJ4&pid=Api")
  user6 = User.new(
  email: "lion@gmail.com",
  password: "123456",
  first_name: "Lionel" ,
  second_name: "Messi" ,
  phonenumber: 160160515,
  bio: "So good to be alive , lets goo!",
  username: "THE GOAT"
)
user6.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user6.save

  file = URI.open("https://tse1.mm.bing.net/th?id=OIP.hdD6qW_-UBv4dpKI59HDBwHaGz&pid=Api")
  user7 = User.new(
  email: "kelly@gmail.com",
  password: "123456",
  first_name: "Kelly" ,
  second_name: "Parker" ,
  phonenumber: 160160515,
  bio: "I enjoy playing games with my mates ",
  username: "KELLYGIRL1"
)
user7.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user7.save

  file = URI.open("https://avatars.githubusercontent.com/u/113447311?v=4")
  user8 = User.new(
  email: "kiki@gmail.com",
  password: "123456",
  first_name: "Kiki" ,
  second_name: "Kennedy" ,
  phonenumber: 160160515,
  bio: "My journey with games has been a weird but fruity one, I really enjoy games but I rarely win ",
  username: "KEEKSGOOI"
)
user8.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user8.save

  file = URI.open("https://tse3.mm.bing.net/th?id=OIP.6L9jE3aVWU1ivXdPG7PNjAHaHR&pid=Api")
  user9 = User.new(
  email: "molly@gmail.com",
  password: "123456",
  first_name: "Molly",
  second_name: "MOO" ,
  phonenumber: 160160515,
  bio: "Please let me win, just one game of Catan. I have been studying the game for years now and never won one. ",
  username: "MOLLY :)"
)
user9.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user9.save

  file = URI.open("https://tse2.mm.bing.net/th?id=OIP.hTeMFkhuRFQFuzZsQizc5gHaEo&pid=Api")
user10 = User.new(
  email: "emily@gmail.com",
  password: "123456",
  first_name: "Emily" ,
  second_name: "Goop" ,
  phonenumber: 160160515,
  bio: "I think the best way to describe me would be via the song HELLO from Adele ",
  username: "GOOPO69"
)
user10.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user10.save

  file = URI.open("https://wallpapertag.com/wallpaper/full/9/9/f/716759-funny-monkey-wallpaper-1920x1080-for-android-tablet.jpg")
user11 = User.new(
  email: "ty@gmail.com",
  password: "123456",
  first_name: "Tyrone",
  second_name: "Cummins",
  phonenumber: 160160515,
  bio: "I love code names, with my vocab its no doubt I have never lost a game, looking for a new team member. ",
  username: "KELLYGIRL1"
)
user11.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user11.save

  file = URI.open("https://cdn.images.dailystar.co.uk/dynamic/1/photos/893000/faces-299893.jpg")
  user12 = User.new(
  email: "janine@gmail.com",
  password: "123456",
  first_name: "janine",
  second_name: "Legend",
  phonenumber: 160160515,
  bio: "Hi, I am from Cape Town, over going out and drinking but I really love have a few glases of wine and playing a nice boardgame ",
  username: "JANNIE(:"
)
user12.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user12.save

  file = URI.open("http://www.funnyjunksite.com/pictures/wp-content/uploads/2015/06/Old-Alien.jpg")
  user13 = User.new(
  email: "kelly@gmail.com",
  password: "123456",
  first_name: "Kelly",
  second_name: "Parker",
  phonenumber: 160160515,
  bio: "I enjoy playing games with my mates ",
  username: "KELLYTHELEGEND"
)
user13.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user13.save

  file = URI.open("http://1.bp.blogspot.com/-6fIRzTkJZo4/TovWZ9RcK4I/AAAAAAAABzg/E8MDXobSP54/s1600/38871-hi-Bob_Marley2.jpg")
  user14 = User.new(
  email: "Luno@gmail.com",
  password: "123456",
  first_name: "Luno",
  second_name: "LUUN",
  phonenumber: 160160515,
  bio: "Well well well, what to say.",
  username: "LunoGIRL1"
)
user14.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user14.save

  file = URI.open("https://tse4.mm.bing.net/th?id=OIP.8Q01DtFe6Q1hpuzCi_ISSAHaHa&pid=Api")
user15 = User.new(
  email: "SY@gmail.com",
  password: "123456",
  first_name: "SY",
  second_name: "SIMMONS",
  phonenumber: 160160515,
  bio: "Every dog has its day... not me mate",
  username: "SYBOI"
)
user15.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user15.save

file = URI.open("https://tse3.mm.bing.net/th?id=OIP.icHh1R6JVB186OIWv0RyZQHaJ4&pid=Api")

user16 = User.new(
  email: "jonty@gmail.com",
  password: "123456",
  first_name: "jonty",
  second_name: "Rhodes",
  phonenumber: 160160515,
  bio: "I used to be a fantastic cricketer, looking to meet new people and play some games ",
  username: "CATCHY"
)
  user16.profile_pic.attach(io: file, filename: "nes.png", content_type: "image/png")
  user16.save

puts "#{User.count} users created"

puts "Creating events"

#  User.all.each do |user|

    file = URI.open("https://i.pinimg.com/474x/aa/a9/60/aaa9601beeee93ff5e0dffd4325a5ef9.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/82/e8/5f/82e85f77f610b5d41390e819c187fa36.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/b9/87/c2/b987c2fb221a710fda4c947fa4c84fef.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/3d/a7/0f/3da70f7638822e2d03421fbe7077a386.jpg")
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

    file = URI.open("https://i.pinimg.com/564x/31/d4/d6/31d4d6b95ffb2504f958664c3523119c.jpg")
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

    file = URI.open("https://i.pinimg.com/564x/a4/8a/35/a48a35d544c9c48cb4cec3fee2de5455.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/30/1b/6b/301b6b14e4edfd466b4da42caac7a43e.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/c4/0c/65/c40c655ae4e5686ccdf5675dd07f26a3.jpg")
    eventeight = Event.new(
      date: DateTime.now + 2.weeks,
      user_id: User.all.sample.id,
      name: "Champs only",
      game_id: Game.all.sample.id,
      address: ": 27, Tradewinds Circle, Cape Town",
      description: "Please bring some wine and snacks",
      capacity: rand(3..8)

    )
    eventeight.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventeight.save!

    file = URI.open("https://i.pinimg.com/474x/7a/ed/fc/7aedfc87b4bb1895a9b579102b3c8417.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/00/80/0a/00800a82dd4ae59e1aff78886cc304cf.jpg")
    eventten = Event.new(
      date: DateTime.now + 15.weeks,
      user_id: User.all.sample.id,
      name: "SO amped for this guys",
      game_id: Game.all.sample.id,
      address: "15, Waboomskloof",
      description: "Lets be respectful of our opponents as well as the game we are playing",
      capacity: rand(3..8)

    )
    eventten.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    eventten.save!



    file = URI.open("https://i.pinimg.com/474x/16/87/0c/16870ccb627f0cccca5cc5efe1fbae6a.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/6e/0b/3e/6e0b3ee5c00a91db19e9a7650e4cfe71.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/45/8e/01/458e016278a10a66f4d7e3f03f94012e.jpg")
    event13 = Event.new(
      date: DateTime.now + 7.days,
      user_id: User.all.sample.id,
      name: "Lets have some fun ",
      game_id: Game.all.sample.id,
      address: "54, Walmer Road",
      description: "Good clean fun please",
      capacity: rand(3..8)

    )
    event13.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    event13.save!

    file = URI.open("https://i.pinimg.com/474x/76/22/dd/7622dde0d3d9cd0420ae3e6ba2139f9f.jpg")
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

    file = URI.open("https://i.pinimg.com/564x/44/bf/a4/44bfa4a386dc402adf8ff8566515716d.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/c7/3b/97/c73b9715dd7299608b4be895643363ef.jpg")
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

    file = URI.open("https://i.pinimg.com/474x/81/86/89/818689ee1f341e25c23f9a1f4e159630.jpg")
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

100.times do
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
