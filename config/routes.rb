Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :user_addresses
      resources :categories
      resources :batches
      resources :products
      resources :payments
      resources :orders
      resources :reviews
    end
  end

end
