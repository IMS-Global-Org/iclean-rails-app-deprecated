Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: [] do
      resources :addresses
      patch :reset_password, on: :member
    end
  end

  # Do not place any routes below this one
  get '*other', to: 'static#index'
end
