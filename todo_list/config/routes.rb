Rails.application.routes.draw do
  resources :todos do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  root 'todos#index'
end
