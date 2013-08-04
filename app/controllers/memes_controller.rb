class MemesController < ApplicationController
  def index
    @meme_captions = MemeCaption.order("ID DESC").page(params[:page]).per(100)
  end

  def show
    @meme_caption = MemeCaption.find(params[:id])
  end

  def new_caption
    @meme_image = MemeImage.find(params[:id])
    @meme_caption = @meme_image.meme_captions.build
  end

  def images
    @meme_images = MemeImage.order("ID DESC").page(params[:page]).per(100)
  end

  def new
    @meme_image = MemeImage.new
  end

  def caption_meme
    @meme_image = MemeImage.find(params[:id])
    @meme_caption = @meme_image.meme_captions.build(meme_caption_params)
    respond_to do |format|
      if @meme_caption.save
        format.html { redirect_to meme_path(@meme_caption), notice: 'Meme was successfully created.' }
      else
        format.html { render action: 'new_caption' }
      end
    end
  end

  def upload
    @meme_image = MemeImage.new(meme_image_params)
    respond_to do |format|
      if @meme_image.save
        format.html { redirect_to caption_meme_path(@meme_image), notice: 'Meme was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def meme_image_params
    params.require(:meme_image).permit(:name, :meme)
  end
  def meme_caption_params
    params.require(:meme_caption).permit(:upper_caption, :lower_caption)
  end
end
