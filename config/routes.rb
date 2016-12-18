Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://uides.rubyonrails.org/routing.html
  root to: "users#index"
  resources :users,except: [:update,:edit,:destroy] do
    member do
      get 'export'
    end
  end
end
