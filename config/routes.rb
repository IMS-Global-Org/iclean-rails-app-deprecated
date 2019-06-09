Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

    resources :users, only: [] do
      resources :addresses
      patch :reset_password, on: :member

      resource :demographics do
        get :genders, on: :collection
        get :ethnicities, on: :collection
        get :races, on: :collection
      end

      resources :psychographics do
        resources :questions
        resources :answers
      end
    end

  end

  # Do not place any routes below this one
  get '*other', to: 'static#index'
end
