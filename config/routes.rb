Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users/index'
    end
  end
  get 'users/index', to: 'api/v1/users#index'
end
