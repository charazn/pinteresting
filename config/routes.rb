Rails.application.routes.draw do
  
  root 'home#index'
  get '/about' => 'home#about'
  devise_for :users
  resources :pins

end
