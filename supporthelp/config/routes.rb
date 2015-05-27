Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'

  root 'static_pages#index'

  devise_for :users
end
