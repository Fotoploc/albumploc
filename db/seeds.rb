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
    puts "Creating stickers..."
    Sticker.create!(code: "FTP1", description: "Sticker 1 description", picture: "https://i.imgur.com/1Z1Z1Z1.jpg")
    Sticker.create!(code: "FTP2", description: "Sticker 2 description", picture: "https://i.imgur.com/2Z2Z2Z2.jpg")
    Sticker.create!(code: "FTP3", description: "Sticker 3 description", picture: "https://i.imgur.com/3Z3Z3Z3.jpg")
    Sticker.create!(code: "FTP4", description: "Sticker 4 description", picture: "https://i.imgur.com/4Z4Z4Z4.jpg")
    Sticker.create!(code: "FTP5", description: "Sticker 5 description", picture: "https://i.imgur.com/5Z5Z5Z5.jpg")
    puts "Done!"
    puts "Adding stickers to users..."
    User.first.stickers.push(Sticker.all)
    User.last.stickers.push(Sticker.all)
    puts "Done!"
    puts "Creating albums..."
    Album.create!(name: "Album 1", description: "Album 1 description", picture: "https://i.imgur.com/1Z1Z1Z1.jpg")
    Album.create!(name: "Album 2", description: "Album 2 description", picture: "https://i.imgur.com/2Z2Z2Z2.jpg")
    Album.create!(name: "Album 3", description: "Album 3 description", picture: "https://i.imgur.com/3Z3Z3Z3.jpg")
    Album.create!(name: "Album 4", description: "Album 4 description", picture: "https://i.imgur.com/4Z4Z4Z4.jpg")
    Album.create!(name: "Album 5", description: "Album 5 description", picture: "https://i.imgur.com/5Z5Z5Z5.jpg")
    puts "Done!"
    puts "Adding albums to users..."
    User.first.albums.push(Album.all)
    User.last.albums.push(Album.all)
    puts "Done!"
    puts "Adding stickers to albums..."
    Album.find(1).stickers.push(Sticker.first(2))
    Album.find(2).stickers.push(Sticker.first(3))
    Album.find(3).stickers.push(Sticker.first(4))
    Album.find(4).stickers.push(Sticker.first(5))
    Album.find(5).stickers.push(Sticker.first(1))
    puts "Done!"

    puts "Seeding database complete!"
