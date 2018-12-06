Rails.application.routes.draw do
  # resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :songs
      resources :albums
      resources :artists do
        member do
          get 'albums'
          get 'albums/:album_id', to: 'albums#album'
          get 'songs'
          get 'songs/:song_id', to: 'songs#song'
        end
      end
    end
  end
end
