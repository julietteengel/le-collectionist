# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '(:locale)' do
    root 'shops#index'
    resources :shops, only: %i[index show]
  end
end
