Rails.application.routes.draw do
  
  root 'pins#index'
  get '/index' => 'home#index'
  get '/about' => 'home#about'
  devise_for :users
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end
  resources :pins, :concerns => :paginatable

end
