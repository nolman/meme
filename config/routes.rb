Meme::Application.routes.draw do
  root 'meme_images#index'
  resources :meme_images do
    resources :meme_captions
  end
end
