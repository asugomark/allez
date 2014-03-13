DoneBiz::Application.routes.draw do
  
  devise_for :users

  devise_scope :user do
  	get '/signup' => 'devise/registrations#new'
  	get '/signin' => 'devise/sessions#new'
  end

  root 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
end
