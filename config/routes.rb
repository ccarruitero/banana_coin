Rails.application.routes.draw do
  resources :accounts, only: [:show, :new, :create] do
    resources :transactions, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
