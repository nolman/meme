class CreateMemeCaptions < ActiveRecord::Migration
  def change
    create_table :meme_captions do |t|
      t.string :upper_caption
      t.string :lower_caption
      t.string :font
      t.integer :meme_image_id
      t.timestamps
    end
    add_index :meme_captions, :meme_image_id
  end
end
