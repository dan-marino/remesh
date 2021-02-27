Rails.application.routes.draw do

  namespace :api do
    resources :conversations, only: [:index, :create, :show] do
      resources :messages, only: [:create]
    end

    resources :messages, only: [:index, :show] do
      resources :thoughts, only: [:create]
    end
  end
end
