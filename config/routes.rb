Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope "(:locale)" do
    root 'shops#index'
    resources :shops, only: [:index, :show]
  end
end