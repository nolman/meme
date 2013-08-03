FactoryGirl.define do
  factory :meme_image do
    name 'helloworld'
    meme { File.new(Rails.root.join('spec', 'fixtures', 'success.jpg')) }
  end

  factory :meme_caption do
    meme_image
    upper_caption 'helloworld'
    lower_caption 'helloworld'
  end
end
