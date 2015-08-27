Rails.application.routes.draw do
  
  root 'pins#index'

  get '/index' => 'home#index'
  get '/about' => 'home#about'

  resources :user_sessions, only: :create
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :users, except: :index do 
    put :deactivate, :on => :member, :path => :cancel
  end

  # devise_for :users # Switched to Sorcery
  
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end
  
  resources :pins, :concerns => :paginatable do
    # NOT USING BECAUSE /pin/1/archive IS VISIBLE
    put :archive, :on => :member, :path => :delete
    # NOT put :archive, :on => :member, :as => :delete
    # generates delete_pin_path, /pins/:id/archive, pins#archive
  
    member do 
      put :favorite, :action => :upvote, :as => :upvote
      put :unfavorite, :action => :undo_upvote, :as => :undo_upvote
      # put 'dislike' => 'pins#downvote'
      # put 'undislike' => 'pins#undo_downvote'
    end
  
    resources :comments, :only => [:new, :create, :edit, :update]
  end

end
