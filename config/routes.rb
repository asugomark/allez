DoneBiz::Application.routes.draw do
  
  devise_for :users, :skip => [:registrations, :sessions]

  as :user do

  	# devise/registrations
  	get '/signup' => 'devise/registrations#new', :as => :new_user_registration
  	post '/signup' => 'devise/registrations#create', :as => :user_registration
  	get '/users/cancel' => 'devise/registrations#cancel', :as => :cancel_user_registration
  	get '/:id/edit/' => 'devise/registrations#edit', :as => :edit_user_registration
  	put '/signup' => 'devise/registrations#update'
  	delete 'users/cancel' => 'devise/registrations#destroy'

  	# devise/sessions
  	get '/signin' => 'devise/sessions#new', :as => :new_user_session
  	post '/signin' => 'devise/sessions#create', :as => :user_session
  	delete '/signout' => 'devise/sessions#destroy', :as => :destroy_user_session

  end

  resources :users, :only=>[:show] do
  	resources :avatars
  end
  get "users/show"

  root 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/settings', to: 'static_pages#settings', via: 'get'
  
end
