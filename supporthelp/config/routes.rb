Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'

  resources :tickets do
  	resources :comments, only:[:create]
  end

  patch   'tickets/get_in_charge/:id' => 'tickets#get_in_charge',     as: 'get_in_charge'
  patch   'tickets/update_category/:id' => 'tickets#update_category', as: 'update_category'
  patch   'tickets/update_priority/:id' => 'tickets#update_priority', as: 'update_priority'

  match 'tickets/fill_category_select/:sent_id' => 'tickets#fill_category_select', via: :get

  devise_for :users

  authenticated :user do
	  root "tickets#index", as: "authenticated_root"
	end

  root 'static_pages#index'
end
