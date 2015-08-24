Rails.application.routes.draw do
  
  root 'pins#index'

  get '/index' => 'home#index'
  get '/about' => 'home#about'

  resources :user_sessions, only: :create
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :users, except: :index

  # devise_for :users
  
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end
  
  resources :pins, :concerns => :paginatable do
    put :archive, :on => :member
    resources :comments, only: [:new, :create, :edit, :update]
  end

end
