class ExchangeController < ApplicationController
  before_action :authenticate_user!

  def index
    @sender = User.find(current_user.id)
    @receiver = User.find(params[:user_id])
    @album = Album.find(params[:album_id])
    @sender_stickers = get_user_stickers_by_album(@sender, @album)
    @receiver_stickers = get_user_stickers_by_album(@receiver, @album)
  end

  def all
    @user = User.find(current_user.id)
    @exchanges = Exchange.where(sender_id: @user.id).or(Exchange.where(receiver_id: @user.id))
  end
  
  def new
    @sender = User.find(current_user.id)
    @receiver = User.find(params[:user_id])
    @sender_stickers = get_user_stickers_by_ids(@sender, params[:sendesticker_ids])
    @receiver_stickers = get_user_stickers_by_ids(@receiver, params[:receivesticker_ids])
    Exchange.create(sender_id: @sender.id, receiver_id: @receiver.id, status: "Pendente")
    @sender_stickers.each do |sticker|
      SenderSticker.create(exchange_id: Exchange.last.id, sticker_id: sticker.id)
    end
    @receiver_stickers.each do |sticker|
      ReceiverSticker.create(exchange_id: Exchange.last.id, sticker_id: sticker.id)
    end
    redirect_to all_exchanges_path
  end

  def show
    @user = User.find(current_user.id)
    @exchange = Exchange.find(params[:exchange_id])
    @sender = User.find(@exchange.sender_id)
    @receiver = User.find(@exchange.receiver_id)
    @sender_stickers = []
    @exchange.sender_stickers.each do |userSticker|
      @sender_stickers << Sticker.find(userSticker.sticker_id)
    end
    @receiver_stickers = []
    @exchange.receiver_stickers.each do |userSticker|
      @receiver_stickers << Sticker.find(userSticker.sticker_id)
    end
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
    if(@exchange.status == "Pendente")
      @sender = User.find(@exchange.sender_id)
      @receiver = User.find(@exchange.receiver_id)
      @exchange.sender_stickers.each do |sender_sticker|
        @receiver.stickers << UserSticker.new(sticker_id: sender_sticker.sticker_id, user_id: @sender.id)
      end
      @exchange.receiver_stickers.each do |receiver_sticker|
        @sender.stickers << UserSticker.new(sticker_id: receiver_sticker.sticker_id, user_id: @receiver.id)
      end

      @exchange.sender_stickers.each do |sender_sticker|
        sticker = @sender.stickers.find_by(sticker_id: sender_sticker.sticker_id)
        sticker.update(is_active: false)
        turn_others_exchanges_unavailable(sticker, @sender)
      end

      @exchange.receiver_stickers.each do |receiver_sticker|
        sticker = @receiver.stickers.find_by(sticker_id: receiver_sticker.sticker_id)
        sticker.update(is_active: false)
        turn_others_exchanges_unavailable(sticker, @receiver)
      end
      @exchange.update(status: "Aceito")
    end
    redirect_to all_exchanges_path
  end

  def turn_others_exchanges_unavailable(sticker, user)
    @exchanges = Exchange.where(sender_id: user.id).or(Exchange.where(receiver_id: user.id))
    @exchanges.each do |exchange|
      exchange.sender_stickers.each do |sender_sticker|
        sender_sticker.sticker_id == sticker.id ? exchange.update(status: "Indisponível") : nil
      end
      exchange.receiver_stickers.each do |receiver_sticker|
        receiver_sticker.sticker_id == sticker.id ? exchange.update(status: "Indisponível") : nil
      end
    end
  end

  private
  def get_user_stickers_by_ids(user, sticker_ids)
    stickers = []
    sticker_ids.each do |sticker_id|
      user_stickers = user.stickers.find_by(sticker_id: sticker_id)
      stickers << Sticker.find(user_stickers.sticker_id)
    end
    stickers
  end

  def get_user_stickers_by_album(user, album)
    stickers_of_album = Sticker.where(album_id: album.id)
    stickers = []
    user.stickers.each do |userSticker|
      stickers_of_album.each do |sticker|
        sticker.id == userSticker.sticker_id ? stickers << sticker : nil
      end
    end
    stickers
  end
end
