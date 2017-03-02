Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resource :chat, as: :chat, only: :show
  get 'sign_in', to: 'sessions#new', as: :sign_in
  get 'sign_out', to: 'sessions#destroy', as: :sign_out
  resources :sessions, only: :create

  root to: 'chats#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
