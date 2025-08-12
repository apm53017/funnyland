Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
  end

  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about", as: "about"
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :reviews, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get 'mypage'
    end
  end
  
  get '/search', to: 'searches#search'

end
