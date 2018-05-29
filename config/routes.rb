Rails.application.routes.draw do
  
  # Pages routes
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  # Blogs routes
  resources :blogs

  # Portfolio routes
  resources :portfolios
  
end
