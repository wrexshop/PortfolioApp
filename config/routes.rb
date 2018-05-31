Rails.application.routes.draw do
  # Set application home page
  root to: 'pages#home'

  # Exmaple of custom routes
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # Blogs routes
  resources :blogs

  # Portfolio routes
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
end
