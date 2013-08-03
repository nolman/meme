FactoryGirl.define do
  factory :meme_image do
    name 'helloworld'
    meme { File.new(Rails.root.join('spec', 'fixtures', 'success.jpg')) }
  end
end
