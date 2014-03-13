DoneBiz::Application.routes.draw do
  
  root 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
  
end
