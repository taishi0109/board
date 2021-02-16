Rails.application.routes.draw do
  root 'topics#index'
  resources :topics, only: [:index, :show, :new, :delete, :create] do
    resources :posts, only: [:show, :edit, :update, :create], module: :topics
  end

  resources :posts do
    collection do
      get 'search'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
