Rails.application.routes.draw do

   devise_for :users
   root to: 'homes#top'
   get "about" => "homes#about" , as: "about"



  resources :users do
    member do
      get :following, :followers, :like_posts, :posts
    end
    get :search, on: :collection
  end
  get :signup, to: 'users#new'


   resources :posts, only: [:index,:show,:new,:create,:destroy]


end
