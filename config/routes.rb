Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  get '/sites/search', to: 'sites#search', as: 'sites_search'
  post '/sites/:id/update_tags', to: 'sites#update_tags', as: 'sites_update_tags'
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
