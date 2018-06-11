Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json }, path: 'api' do
    devise_for :users, skip: [:registrations, :sessions]
    as :user do
      post 'sign_up' => 'users/registrations#create', as: :user_registration
      post 'sign_in' => 'users/sessions#create', as: :user_session
      delete 'sign_out' => 'users/sessions#destroy', as: :destroy_user_session
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
