Rails.application.routes.draw do
  # Pages routes
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  # Blogs route
  resources :blogs
end
