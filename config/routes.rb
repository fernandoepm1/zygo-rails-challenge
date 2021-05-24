# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'books#index'

  get 'books/index'

  devise_for :users
  mount RailsAdmin::Engine => '/command_center', as: 'rails_admin'
end
