DoneBiz::Application.routes.draw do
  
  devise_for :users
  root 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
  
end
