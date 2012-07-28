Mlug::Application.routes.draw do
  get "welcome/index"
  get "welcome/about"

  resources :posts

  devise_for :users
  root :to => 'welcome#index'

  match 'about' => 'welcome#about'
end
