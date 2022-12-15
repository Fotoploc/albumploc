module StickersPackHelper

    def open_sticker_pack
        user = User.find(current_user.id)
        album = Album.find(params[:album_id])

        user_stickers = UserSticker.where(user_id: user.id)
        album_stickers = Sticker.where(album_id:album.id)

        newest_stickers = album_stickers.map {|sticker| !user_stickers.include?(sticker) }

        new_sticker = newest_stickers.sample
        random_stickers = Sticker.where(album_id:album.id).order("RANDOM()").limit(4)

        p new_sticker
        p random_stickers
        
        #@stickers = new_sticker + random_stickers
    end
end
