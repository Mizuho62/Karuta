Rails.application.routes.draw do

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :games do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
end
resources :practices 


  resources :blogs

  devise_for :users, controllers: {   registrations: 'users/registrations',
  sessions: 'users/sessions' }

  resources :users, only: [:show] # ユーザーマイページへのルーティング

  
  root 'game#index'
  post 'games' => 'games#create'
end

