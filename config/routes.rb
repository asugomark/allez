DoneBiz::Application.routes.draw do
  
  devise_for :users, :skip => [:registrations, :sessions]

  as :user do

  	# devise/registrations
  	get '/signup' => 'devise/registrations#new', :as => :new_user_registration
  	post '/signup' => 'devise/registrations#create', :as => :user_registration

  	# devise/sessions
  	get '/signin' => 'devise/sessions#new', :as => :new_user_session
  	post '/signin' => 'devise/sessions#create', :as => :user_session
  	delete '/signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users, :only=>[:show]
  get "users/show"

  root 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
end
