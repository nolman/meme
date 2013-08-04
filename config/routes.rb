Meme::Application.routes.draw do
  root 'memes#index'
  resources :memes do
    member do
      get :caption, action: :new_caption
      post :caption, action: :caption_meme
    end
    collection do
      get :images
      post :upload
    end
  end
#  resources :meme_images do
#    resources :meme_captions
#  end
end
