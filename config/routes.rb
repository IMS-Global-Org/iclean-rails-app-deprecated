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
        resources :answers do
          collection do
            patch :batch_yes_no
            get :batch_show
            delete :batch_destroy
          end
        end
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

  # Do not place any routes below this one
  get '*other', to: 'static#index'
end
