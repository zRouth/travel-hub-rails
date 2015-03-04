Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: [:index, :new, :edit]
      resources :trips, except: [:new, :edit]
    end
  end
end
