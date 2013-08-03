class MemeImage < ActiveRecord::Base
  mount_uploader :meme, MemeUploader
  validates_presence_of :name
  validates_presence_of :meme
end
