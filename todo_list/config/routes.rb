Rails.application.routes.draw do
  resources :todos do
    resources :todo_items
  end
  root 'todos#index'
end
