# encoding: utf-8
require 'carrierwave/processing/mime_types'
require 'carrierwave/processing/rmagick'

class MemeUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes

  process :set_content_type
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
