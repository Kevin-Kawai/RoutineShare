Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "staticpages#index"
  get 'underConstruction', to: 'staticpages#construction'
  resources :routines, only: [:index,:show,:new,:create] do
    resources :activities, only: [:new,:create]
  end
end
