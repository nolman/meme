class MemeCaptionsController < ApplicationController
  before_action :set_meme_image
  before_action :set_meme_caption, only: [:show, :edit, :update, :destroy]

  def index
    @meme_captions = @meme_image.meme_captions.load
  end

  def new
    @meme_caption = @meme_image.meme_captions.build
  end

  def create
    @meme_caption = @meme_image.meme_captions.build(meme_caption_params)
    respond_to do |format|
      if @meme_caption.save
        format.html { redirect_to meme_image_meme_caption_path(@meme_image, @meme_caption), notice: 'Meme Caption was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @meme_caption.update(meme_caption_params)
        format.html { redirect_to meme_image_meme_caption_path(@meme_image, @meme_caption), notice: 'Meme Caption was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @meme_caption.destroy
    respond_to do |format|
      format.html { redirect_to meme_image_meme_captions_path(@meme_image) }
    end
  end

  private
  def set_meme_image
    @meme_image = MemeImage.find(params[:meme_image_id])
  end

  def set_meme_caption
    @meme_caption = @meme_image.meme_captions.find(params[:id])
  end

  def meme_caption_params
    params.require(:meme_caption).permit(:upper_caption, :lower_caption, :font)
  end
  
end
