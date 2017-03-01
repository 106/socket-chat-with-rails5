Rails.application.routes.draw do
  resource :chat, as: :chat
  root to: 'chats#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
