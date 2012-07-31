Mlug::Application.routes.draw do
  get "welcome/index"
  get "welcome/about"

  resources :posts do
    resources :comments, :except => [ :new, :show ]
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
