Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :accounts, only: [:index, :show, :create, :destroy, :update ]
      resources :sessions, only: [:create, :logged_in, :logout]
      resources :registrations, only: [:create]
      delete :logout, to: 'sessions#logout'
      get :logged_in, to: 'sessions#logged_in'
    end
  end

  

end
