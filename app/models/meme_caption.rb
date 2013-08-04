class MemeCaption < ActiveRecord::Base
  belongs_to :meme_image
  validate :caption_required

  def caption_required
    if(upper_caption.blank? && lower_caption.blank?)
      errors.add(:lower_caption, "Caption Required")
    end
  end
end
