Rails.application.routes.draw do

  devise_for :users
  resources :sites, only: %i[new index show edit create destroy update]

  unauthenticated :user do
    root to: 'homes#top', as: :unauthenticated_root
  end

  authenticated :user do
    root to: 'users#show'
  end

  get '/api/preview', to: 'api#preview'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
