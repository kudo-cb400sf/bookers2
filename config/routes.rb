Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  devise_for :users
  # get 'users/sign_in' => 'devise/sessions#new'
  # get 'users/sign_out' => 'devise/sessions#destroy'

  post 'books' => 'books#create'
  get "users" => redirect("/users/sign_up")
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:index, :new, :create, :show, :edit ,:update, :destroy]
  resources :post_images, only: [:index, :new, :create, :show, :destroy]
  resource :favorites, only: [:create, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
