Rails.application.routes.draw do
  namespace :api do
    resource :user, only: [:create, :show, :update, :destroy], controller: :user

    resource :post, only: [:create, :show, :update, :destroy], controller: :post

    resource :comment, only: [:create, :show, :update, :destroy], controller: :comment
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
