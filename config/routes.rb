Rails.application.routes.draw do
  resources :songs
  resources :users
#  resources :sessions
  resources :selections

  root to: 'users#index'
  
  post 'login' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
  get 'songs' => 'songs#index'
  post '/songs' => 'songs#create'
  get 'songs/:id' => 'songs#show'
  post 'selections/:song_id' => 'selections#create'
end
