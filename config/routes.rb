Rails.application.routes.draw do
  root to: 'books#index'

  get 'books/index'
  get 'books/show'
  devise_for :users
  mount RailsAdmin::Engine => '/command_center', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
