Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :monkeys, only: [:index, :show, :new, :create, :destroy] do
    resources :getaways, only: [:show, :new, :create]
  end
  resources :getaways, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
