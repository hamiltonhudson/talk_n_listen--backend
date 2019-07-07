Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auth, only: [:create]
      resources :users, only: [:index, :show, :create]
      resources :chats, only: [:index, :show, :create]
      resources :user_chats, only: [:index, :show, :create]
      # get '/users/:user_id/chats', to: 'users#chat_lists'
      # get '/users/:user_id/userchats', to: 'users#users_chats'
      mount ActionCable.server => '/cable'

    end
  end
end
