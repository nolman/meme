Meme::Application.routes.draw do
  root 'meme_images#index'
  resources :meme_images
end
