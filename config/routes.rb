Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auth, only: [:create]
      # resources :users
      resources :users, only: [:index, :show, :create]
      # resources :chats
      resources :chats, only: [:index, :show, :create]
      # resources :user_chats
      # resources :user_chats, only: [:index]
      get '/users/:user_id/chats', to: 'users#users_chats'

      # mount ActionCable.server => '/cable'

    end
  end
end
