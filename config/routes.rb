Mlug::Application.routes.draw do
  get "welcome/index"
  get "welcome/about"

  resources :posts do
    member do
      post 'comments', to: 'posts#replay', as: :replay
    end
    resources :comments, :except => [ :index, :new, :create ] do
      member do
        post '', to: "comments#replay", as: :replay
      end
    end
  end

  devise_for :users, :controllers => { :passwords => "users/passwords" }
  
  # Private
  namespace :users, :as => "" do
    resource :profile, :only => [ :show, :update ]
  end
  
  # Public
  resources :users, :only => [] do
    get :profile
  end
  
  root :to => 'welcome#index'

  match 'about' => 'welcome#about'
end
