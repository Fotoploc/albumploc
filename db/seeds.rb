# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    puts "Seeding database..."
    puts "Creating users..."
    User.create!(email: "bazinga@fotoploc.com", password: "123456", password_confirmation: "123456")
    User.create!(email: "contato@fotoploc.com", password: "123456", password_confirmation: "123456")
    puts "Done!"
    puts "Creating albums..."
    Album.create!(name: "Album 1", description: "Album 1 description", picture: "https://i.imgur.com/1Z1Z1Z1.jpg")
    Album.create!(name: "Album 2", description: "Album 2 description", picture: "https://i.imgur.com/2Z2Z2Z2.jpg")
    Album.create!(name: "Album 3", description: "Album 3 description", picture: "https://i.imgur.com/3Z3Z3Z3.jpg")
    Album.create!(name: "Album 4", description: "Album 4 description", picture: "https://i.imgur.com/4Z4Z4Z4.jpg")
    Album.create!(name: "Album 5", description: "Album 5 description", picture: "https://i.imgur.com/5Z5Z5Z5.jpg")
    puts "Done!"
    puts "Creating stickers..."
    Album.first.stickers.new(code: "FTP1", description: "Sticker 1 description", picture: "https://i.imgur.com/1Z1Z1Z1.jpg").save
    Album.first.stickers.new(code: "FTP2", description: "Sticker 2 description", picture: "https://i.imgur.com/2Z2Z2Z2.jpg").save
    Album.first.stickers.new(code: "FTP3", description: "Sticker 3 description", picture: "https://i.imgur.com/3Z3Z3Z3.jpg").save
    Album.first.stickers.new(code: "FTP4", description: "Sticker 4 description", picture: "https://i.imgur.com/4Z4Z4Z4.jpg").save
    Album.first.stickers.new(code: "FTP5", description: "Sticker 5 description", picture: "https://i.imgur.com/5Z5Z5Z5.jpg").save
    Album.second.stickers.new(code: "FTP6", description: "Sticker 6 description", picture: "https://i.imgur.com/6Z6Z6Z6.jpg").save
    Album.second.stickers.new(code: "FTP7", description: "Sticker 7 description", picture: "https://i.imgur.com/7Z7Z7Z7.jpg").save
    Album.second.stickers.new(code: "FTP8", description: "Sticker 8 description", picture: "https://i.imgur.com/8Z8Z8Z8.jpg").save
    Album.second.stickers.new(code: "FTP9", description: "Sticker 9 description", picture: "https://i.imgur.com/9Z9Z9Z9.jpg").save
    Album.second.stickers.new(code: "FTP10", description: "Sticker 10 description", picture: "https://i.imgur.com/10Z10Z10.jpg").save
    Album.third.stickers.new(code: "FTP11", description: "Sticker 11 description", picture: "https://i.imgur.com/11Z11Z11.jpg").save
    Album.third.stickers.new(code: "FTP12", description: "Sticker 12 description", picture: "https://i.imgur.com/12Z12Z12.jpg").save
    Album.third.stickers.new(code: "FTP13", description: "Sticker 13 description", picture: "https://i.imgur.com/13Z13Z13.jpg").save
    Album.third.stickers.new(code: "FTP14", description: "Sticker 14 description", picture: "https://i.imgur.com/14Z14Z14.jpg").save
    Album.third.stickers.new(code: "FTP15", description: "Sticker 15 description", picture: "https://i.imgur.com/15Z15Z15.jpg").save
    Album.fourth.stickers.new(code: "FTP16", description: "Sticker 16 description", picture: "https://i.imgur.com/16Z16Z16.jpg").save
    Album.fourth.stickers.new(code: "FTP17", description: "Sticker 17 description", picture: "https://i.imgur.com/17Z17Z17.jpg").save
    Album.fourth.stickers.new(code: "FTP18", description: "Sticker 18 description", picture: "https://i.imgur.com/18Z18Z18.jpg").save
    Album.fourth.stickers.new(code: "FTP19", description: "Sticker 19 description", picture: "https://i.imgur.com/19Z19Z19.jpg").save
    Album.fourth.stickers.new(code: "FTP20", description: "Sticker 20 description", picture: "https://i.imgur.com/20Z20Z20.jpg").save
    Album.fifth.stickers.new(code: "FTP21", description: "Sticker 21 description", picture: "https://i.imgur.com/21Z21Z21.jpg").save
    Album.fifth.stickers.new(code: "FTP22", description: "Sticker 22 description", picture: "https://i.imgur.com/22Z22Z22.jpg").save
    Album.fifth.stickers.new(code: "FTP23", description: "Sticker 23 description", picture: "https://i.imgur.com/23Z23Z23.jpg").save
    Album.fifth.stickers.new(code: "FTP24", description: "Sticker 24 description", picture: "https://i.imgur.com/24Z24Z24.jpg").save
    Album.fifth.stickers.new(code: "FTP25", description: "Sticker 25 description", picture: "https://i.imgur.com/25Z25Z25.jpg").save
    puts "Done!"
    puts "Adding stickers to users..."
    Sticker.first(12).each do |sticker|
        User.first.stickers << UserSticker.new(sticker_id: sticker.id, user_id: User.first.id)
    end
    Sticker.last(13).each do |sticker|
        User.second.stickers << UserSticker.new(sticker_id: sticker.id, user_id: User.second.id)
    end
    puts "Done!"
    puts "Adding albums to users..."
    User.first.albums.push(Album.all)
    User.last.albums.push(Album.all)
    puts "Done!"
    puts "Creating trades..."
    Exchange.create!(sender_id: User.first.id, receiver_id: User.second.id, status: "Pendente")
    SenderSticker.create!(exchange_id: Exchange.first.id, sticker_id: 11)
    SenderSticker.create!(exchange_id: Exchange.first.id, sticker_id: 12)
    ReceiverSticker.create!(exchange_id: Exchange.first.id, sticker_id: 14)
    Exchange.create!(sender_id: User.second.id, receiver_id: User.first.id, status: "Pendente")
    SenderSticker.create!(exchange_id: Exchange.last.id, sticker_id: 15)
    ReceiverSticker.create!(exchange_id: Exchange.last.id, sticker_id: 11)
    puts "Done!"
    puts "Creating an admin user..."
    User.create!(email: "admin@fotoploc.com.br", password: "123456", password_confirmation: "123456")
    User.last.permission.update(is_admin: true)
    User.last.albums.push(Album.all)
    Sticker.all.each do |sticker|
        User.last.stickers << UserSticker.new(sticker_id: sticker.id, user_id: User.first.id)
    end
    puts "Done!"

    puts "Seeding database complete!"

