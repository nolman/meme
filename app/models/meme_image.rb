class MemeImage < ActiveRecord::Base
  mount_uploader :meme, MemeUploader
end
