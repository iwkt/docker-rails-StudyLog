Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "study_logs#index"
  resources :study_logs

  # API専用のルート
  namespace :api do
    resources :study_logs, only: [:index, :create, :show]
  end
end
