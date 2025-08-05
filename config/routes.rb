Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about", as: "about"
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get 'mypage'
    end
  end

end
