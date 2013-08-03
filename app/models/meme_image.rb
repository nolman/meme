class MemeImage < ActiveRecord::Base
  has_many :meme_captions
  mount_uploader :meme, MemeUploader
  validates_presence_of :name
  validates_presence_of :meme
end
