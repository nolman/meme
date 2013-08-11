module ApplicationHelper
  def draw_meme(meme_caption, image_size = :default)
    ratio = image_size 
    attrs = {
      class: "meme", image_src: meme_caption.meme_image.meme_url(image_size),
      upper_caption: meme_caption.upper_caption, lower_caption: meme_caption.lower_caption,
      font: meme_caption.font, ratio: MemeUploader::IMAGE_RATIOS[image_size],
    }
    content_tag :canvas, "", attrs
  end
end
