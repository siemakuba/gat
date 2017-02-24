Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :locations, only: :show, param: :country_code
      resources :target_groups, only: :show, param: :country_code
    end

    namespace :internal do
      resources :locations, only: :show, param: :country_code
      resources :target_groups, only: :show, param: :country_code
      resource :evaluate_target, only: :create
    end
  end
end
