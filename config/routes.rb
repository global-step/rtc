Rails.application.routes.draw do
  resources :group_lessons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'group_lessons/index'
  resources :gsa_classes
  root 'group_lessons#index'
end
