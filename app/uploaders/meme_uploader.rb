# encoding: utf-8
require 'carrierwave/processing/mime_types'
require 'carrierwave/processing/rmagick'

class MemeUploader < CarrierWave::Uploader::Base
  DEFAULT_IMAGE_SIZE = [640, 960]
  IMAGE_RATIOS = {
    default: 1.0,
    mini: 1.0/4,
    thumb: 1.0/8,
  }

  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  12
  process :set_content_type
  storage :file
  
  IMAGE_RATIOS.each do |name, ratio|
    version name do
      process resize_to_limit: DEFAULT_IMAGE_SIZE.map {|i| i * ratio}
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
