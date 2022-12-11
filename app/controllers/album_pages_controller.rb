class AlbumPagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    @album = Album.find(params[:id])
    @album_pages = @album.album_page.all
  end

  def edit_pages
    @album = Album.find(params[:album_id])
    @album_pages = @album.album_page.all.order(:page_number)
    @album_page_new = AlbumPage.new
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
  def album_page_params
    params.require(:album_page).permit(:album_id, :page_number, :background_image)
  end

end
