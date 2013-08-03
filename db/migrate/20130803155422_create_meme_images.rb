class CreateMemeImages < ActiveRecord::Migration
  def change
    create_table :meme_images do |t|
      t.string :name
      t.string :meme
      t.timestamps
    end
  end
end
