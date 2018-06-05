Rails.application.routes.draw do
  # Set application home page
  root to: 'pages#home'

  # Exmaple of custom routes
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # Blogs routes before enums for blog status
  #resources :blogs

  # Blog routes using status
  # using Verb: "get"
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  # Portfolio routes
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'
  
end
