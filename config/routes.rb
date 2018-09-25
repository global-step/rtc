Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'book/index'
  resources :gsa_classes
  root 'book#index'
end
