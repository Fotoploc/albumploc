class ExchangeController < ApplicationController

  def index
    @sender = User.find(current_user.id)
    @receiver = User.find(params[:user_id])
    @album = Album.find(params[:album_id])
    @sender_stickers = @sender.stickers.where(album_id: @album.id)
    @receiver_stickers = @receiver.stickers.where(album_id: @album.id)
  end

  def all
    @user = User.find(current_user.id)
    @exchanges = Exchange.where(sender_id: @user.id).or(Exchange.where(receiver_id: @user.id))
  end
  
  def new
    @sender = User.find(current_user.id)
    @receiver = User.find(params[:user_id])
    @sender_stickers = @sender.stickers.find(params[:sender_sticker_ids])
    @receiver_stickers = @receiver.stickers.find(params[:receiver_sticker_ids])
    Exchange.create(sender_id: @sender.id, receiver_id: @receiver.id, status: "Pendente")
    @sender_stickers.each do |sticker|
      SenderSticker.create(exchange_id: Exchange.last.id, s_sticker_id: sticker.id)
    end
    @receiver_stickers.each do |sticker|
      ReceiverSticker.create(exchange_id: Exchange.last.id, r_sticker_id: sticker.id)
    end
    redirect_to all_exchanges_path
  end

  def cancel
    @exchange = Exchange.find(params[:exchange_id])
    @exchange.update(status: "Cancelado")
    redirect_to all_exchanges_path
  end

  def refuse
    @exchange = Exchange.find(params[:exchange_id])
    @exchange.update(status: "Recusado")
    redirect_to all_exchanges_path
  end

  def accept
    @exchange = Exchange.find(params[:exchange_id])
    if(@exchange.status == "pending") 
      @exchange.update(status: "Aceito")
      @sender = User.find(@exchange.sender_id)
      @receiver = User.find(@exchange.receiver_id)
      @sender.stickers << @exchange.receiver_stickers.map(&:r_sticker)
      @sender.stickers.delete(@exchange.sender_stickers.map(&:s_sticker))
      @receiver.stickers << @exchange.sender_stickers.map(&:s_sticker)
      @receiver.stickers.delete(@exchange.receiver_stickers.map(&:r_sticker))
      
      @exchange.sender_stickers.each do |sticker|
        turn_unavailable(sticker, @sender)
      end

      @exchange.receiver_stickers.each do |sticker|
        turn_unavailable(sticker, @receiver)
      end
    end
    redirect_to all_exchanges_path
  end

  def turn_unavailable(sticker, user)
    @exchanges = Exchange.where(sender_id: user.id).or(Exchange.where(receiver_id: user.id))
    @exchanges.each do |exchange|
      if exchange.sender_stickers.where(s_sticker: sticker.id) == nil || exchange.receiver_stickers.where(r_sticker: sticker.id)
        exchange.status = "Indisponível"
      end
    end
  end
end
