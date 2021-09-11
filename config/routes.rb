Rails.application.routes.draw do


root to: 'homes#top'
get "about" => "homes#about" , as: "about"
   devise_for :users,
    controllers: { registrations: 'registrations' }





  resources :users do
    member do
      get :following, :followers, :like_posts, :posts
    end
    get :search, on: :collection
  end
  get :signup, to: 'users#new'


   resources :posts, only: [:index,:show,:new,:create,:destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
   end

end

