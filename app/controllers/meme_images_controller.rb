class MemeImagesController < ApplicationController
  before_action :set_meme_image, only: [:show, :edit, :update, :destroy]

  def index
    @meme_images = MemeImage.all
  end

  def new
    @meme_image = MemeImage.new
  end

  def show
  end

  def create
    @meme_image = MemeImage.new(meme_image_params)
    respond_to do |format|
      if @meme_image.save
        format.html { redirect_to meme_image_path(@meme_image), notice: 'Meme was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @meme_image.update(meme_image_params)
        format.html { redirect_to meme_image_path(@meme_image), notice: 'Meme was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @meme_image.destroy
    respond_to do |format|
      format.html { redirect_to meme_images_path }
    end
  end

  private
  def set_meme_image
    @meme_image = MemeImage.find(params[:id])
  end

  def meme_image_params
    params.require(:meme_image).permit(:name, :meme)
  end
end
