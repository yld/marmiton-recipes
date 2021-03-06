# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  get 'recipes/search', constraints: ->(request) { request.format == :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
