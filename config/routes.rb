Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
