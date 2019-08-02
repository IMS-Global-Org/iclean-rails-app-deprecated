require 'sidekiq/web'

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

      # Exams for a User
      resources :user_exams

      # Exams, Questions and Answers
      resources :exams do
        resources :questions do
          resources :answers do
            collection do
              get :batch, action: :get_batch
              post :batch, action: :post_batch
              patch :batch, action: :patch_batch
            end
          end
        end
      end
    end

  end

  # sidekiq web interface route
  mount Sidekiq::Web => '/sidekiq'

  # Do not place any routes below this one
  get '*other', to: 'static#index'
end
