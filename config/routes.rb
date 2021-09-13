Rails.application.routes.draw do


root to: 'homes#top'
get "about" => "homes#about" , as: "about"
   devise_for :users,
    controllers: { registrations: 'registrations' }

get :signup, to: 'users#new'


  resources :users
  resources :relationships, only: [:create, :destroy]

    resources :posts, only: [:index,:show,:new,:create,:destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
   end






end

