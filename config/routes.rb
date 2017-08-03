Rails.application.routes.draw do
  root 'home#index'
  resources :articles
  resources :categories
  resources :tags
  get '/admins', to: 'admins#index', as: :admins_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
