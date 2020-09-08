Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :calls do
    collection do
      get 'get_vehicle_categories'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
