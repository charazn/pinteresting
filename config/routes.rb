Rails.application.routes.draw do
  
  root 'pins#index'
  get '/about' => 'home#about'
  devise_for :users
  resources :pins

end
