Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'

  resources :tickets

  devise_for :users

  authenticated :user do
	  root "tickets#index", as: "authenticated_root"
	end

  root 'static_pages#index'
end
