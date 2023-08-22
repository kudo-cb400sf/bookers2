Rails.application.routes.draw do
  root to: 'homes#top'

  post 'books' => 'books#create'
  resources :users, only: [:show, :edit]
  resources :books, only: [:index, :new, :create, :show, :edit ,:update, :destroy]
  devise_for :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
