class AlbumPagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @album = Album.find(params[:album_id])
    @album_pages = @album.album_page.all
  end

  def show
    @album = Album.find(params[:id])
    @album_pages = @album.album_page.all
  end

  def edit_pages
    @album = Album.find(params[:album_id])
    @album_pages = @album.album_page.all.order(:page_number)
    @album_page_new = @album.album_page.new
  end

  def add_sticker
    @user = current_user 
    @album = Album.find(params[:album_id])
    @album_page = @album.album_page.find_by(page_number: params[:page_number])
    @stickers = get_user_stickers_by_album(@user, @album).reject { |sticker| PageSticker.find_by(sticker_id: sticker.id) }
  end

  def remove_sticker_from_page
    album = Album.find(params[:album_id])
    puts "achou o album" + album.id.to_s
    album_page = album.album_page.find_by(page_number: params[:page_number])
    puts "achou a pagina" + album_page.id.to_s
    stickers_positoned = album_page.stickers.find_by(sticker_id: params[:sticker_id])
    puts "achou o sticker" + stickers_positoned.id.to_s
    stickers_positoned.destroy
    redirect_to edit_sticker_position_album_page_path(params[:album_id], params[:page_number])
  end

  def add_sticker_to_page
    @user = current_user
    @album = Album.find(params[:album_id])
    @album_page = @album.album_page.find_by(page_number: params[:page_number])
    Sticker.where(id: params[:sticker_id]).each do |sticker|
      if @album_page.stickers.find_by(sticker_id: sticker.id).nil?
        @album_page.stickers.new(sticker_id: sticker.id, position_x: params[:position_x][sticker.id.to_s], position_y: params[:position_y][sticker.id.to_s]).save
      else
        @album_page.stickers.find_by(sticker_id: sticker.id).update(position_x: params[:position_x][sticker.id.to_s], position_y: params[:position_y][sticker.id.to_s])
      end
    end
    redirect_to edit_album_pages_path(@album.id)
  end

  def edit_sticker_position
    @user = current_user
    @album = Album.find(params[:album_id])
    @album_page = @album.album_page.where(page_number: params[:page_number]).first
    @stickers_positons = @album_page.stickers
    @stickers = get_stickers_by_stickers_positions(@stickers_positons)
  end

  def edit
    @album_page = AlbumPage.find(params[:id])
  end
  
  def create
    @album_page = AlbumPage.new(album_page_params)
    if @album_page.save
      redirect_to edit_album_pages_path(@album_page.album_id)
    else
      render edit_album_pages_path(@album_page.album_id), @album_page.erros = "Error"
    end
  end

  def update
    @album_page = AlbumPage.find(params[:id])
    if @album_page.update(album_page_params)
      redirect_to edit_album_pages_path(@album_page.album_id)
    else
      render edit_album_pages_path(@album_page.album_id), @album_page.error = "Error"
    end
  end

  def destroy
    @album_page = AlbumPage.find(params[:id])
    @album_page.destroy
    redirect_to edit_album_pages_path(@album_page.album_id)
  end

  private
  def get_user_stickers_by_album(user, album)
    stickers_of_album = Sticker.where(album_id: album.id)
    user_active_stickers = user.stickers.where(is_active: true)
    stickers = []
    user_active_stickers.each do |userSticker|
      stickers_of_album.each do |sticker|
        sticker.id == userSticker.sticker_id ? stickers << sticker : nil
      end
    end
    stickers
  end

  def get_stickers_by_stickers_positions(stickers_positons)
    stickers = []
    stickers_positons.each do |sticker_position|
      stickers << Sticker.find(sticker_position.sticker_id)
    end
    stickers
  end

  def album_page_params
    params.require(:album_page).permit(:album_id, :page_number, :background_image)
  end

end
