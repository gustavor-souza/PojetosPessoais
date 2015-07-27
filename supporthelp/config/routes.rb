Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'

  resources :tickets do
  	resources :comments, only:[:create]
  end

  match 'tickets/fill_category_select/:sent_id' => 'tickets#fill_category_select', via: :get

  devise_for :users

  authenticated :user do
	  root "tickets#index", as: "authenticated_root"
	end

  root 'static_pages#index'

end
