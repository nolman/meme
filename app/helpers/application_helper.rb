module ApplicationHelper
  def draw_meme(meme_caption)
    content_tag :canvas, "", class: "meme", image_src: meme_caption.meme_image.meme_url, upper_caption: meme_caption.upper_caption, lower_caption: meme_caption.lower_caption
  end
end
