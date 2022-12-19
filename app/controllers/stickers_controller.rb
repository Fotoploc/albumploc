class StickersController < ApplicationController

  before_action :set_sticker, only: %i[ show edit update destroy ]

  # GET /stickers or /stickers.json
  def index
    @album = Album.find(params[:album_id])
    @stickers = @album.stickers.all
  end

  # GET /stickers/1 or /stickers/1.json
  def show
  end

  # GET /stickers/new
  def new
    @sticker = Sticker.new
  end

  # GET /stickers/1/edit
  def edit
  end

  # POST /stickers or /stickers.json
  def create
    @sticker = Sticker.new(sticker_params)
    respond_to do |format|
      if @sticker.save
        User.find(current_user.id).stickers << UserSticker.new(sticker_id: @sticker.id)
        format.json { render :show, status: :created, location: @sticker }
      else
        format.json { render json: @sticker.errors, status: :unprocessable_entity }
      end
    end
  end

  def open_sticker_pack
    user = User.find(current_user.id)
    album = Album.find(params[:album_id])
    stickers_packs = user.stickers_packs.find_by(album_id: album.id)

    if stickers_packs.quantity > 0 
      
      user_stickers = UserSticker.where(user_id: user.id)
      album_stickers = Sticker.where(album_id: album.id)
  
      newest_stickers = []
      album_stickers.each do |album_sticker|
        isEquals = false
        user_stickers.each do |user_sticker|
          isEquals = true if user_sticker.sticker_id == album_sticker.id
        end
        newest_stickers.push(album_sticker) unless isEquals
      end
  
      new_sticker = newest_stickers.sample(5)
      p "new Stickers "*10
      new_sticker.each do |sticker|
        p sticker
      end
      stickers_pack = album_stickers.sample(10)
      p "Stickers pack  antes"*10
      stickers_pack.each do |sticker|
        p sticker
      end
      new_sticker.each do |sticker|
        stickers_pack.push(sticker) if new_sticker.size != 0
      end

      p "Stickers pack  depois"*10
      stickers_pack.each do |sticker|
        p sticker
      end

      
      stickers_pack.each do |pack_sticker|
        hasSticker = false
        p "pack sticker "*10
        p pack_sticker
        next if pack_sticker == nil
        if user_stickers.size != 0
          user_stickers.each do |user_sticker|
            hasSticker = true if user_sticker.sticker_id == pack_sticker.id          
          end
        else
          hasSticker = false
        end
        if hasSticker
          user_sticker = user_stickers.find_by(sticker_id: pack_sticker.id)
          p user_sticker
          user_sticker.quantity = 1 if user_sticker.quantity == nil
          user_sticker.quantity = user_sticker.quantity + 1
          user_sticker.save
        else
          user_stickers.create(sticker_id: pack_sticker.id, quantity: 1)
        end
      end

      stickers_packs.quantity = stickers_packs.quantity - 1
      stickers_packs.save

      #Debug
      p "Suas novas figurinhas são:"
      stickers_pack.each do |sticker|
        p sticker
      end
      p "Você ainda tem essa quantidade de pacotinhos:"
      p stickers_packs.quantity
    else
      p "Sem pacote de figurinhas"
    end
        
    redirect_to new_stickers_page_path(params[:album_id], stickers_pack: stickers_pack)
  end

  def new_stickers
    @new_stickers = []
    @album = Album.find(params[:album_id])

    params[:stickers_pack].each do |sticker| 
      @new_stickers.push(Sticker.find(sticker))
    end
  end

  # PATCH/PUT /stickers/1 or /stickers/1.json
  def update
    respond_to do |format|
      if @sticker.update(sticker_params)
        format.html { redirect_to sticker_url(@sticker), notice: "Sticker was successfully updated." }
        format.json { render :show, status: :ok, location: @sticker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stickers/1 or /stickers/1.json
  def destroy
    @sticker.destroy

    respond_to do |format|
      format.html { redirect_to stickers_url, notice: "Sticker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def stickers
    @user = User.find(current_user.id)
    @stickers = []
    @user.stickers.each do |userSticker|
      @stickers << Sticker.find(userSticker.sticker_id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sticker
      @sticker = Sticker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sticker_params
      params.require(:sticker).permit(:code, :description, :picture, :album_id)
    end
end
