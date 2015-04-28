Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]

  get 'comments/create'

  root 'posts#index'
  resources :posts do
    resources :comments
  end

  get '/about', to: 'pages#about'
end
