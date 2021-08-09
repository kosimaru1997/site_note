Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  devise_for :users

  unauthenticated :user do
    root to: 'homes#top', as: :unauthenticated_root
  end

  authenticated :user do
    root to: 'users#show'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
