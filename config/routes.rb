# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chefs do
    resources :recipes, shallow: true
  end
  root 'chefs#index'
end
