class MemeImage < ActiveRecord::Base
  has_many :meme_captions, dependent: :destroy
  mount_uploader :meme, MemeUploader
  validates_presence_of :name
  validates_presence_of :meme
end
