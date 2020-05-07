Rails.application.routes.draw do
  get 'new', to: 'pages#new'
  post 'score', to: 'pages#score'
  root to: 'pages#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
