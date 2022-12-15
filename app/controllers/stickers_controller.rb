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
      @stickers << Sticker.find(userSticker.id)
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
