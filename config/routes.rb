Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'credits#index'

  resources :artists
  resources :credits

  get "artists/new" => 'artist#new', :as => :newartist
  
end
