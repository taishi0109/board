Rails.application.routes.draw do
  root 'topics#index'
  resources :topics, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:show, :edit, :update, :create], module: :topics do
      # resources :likes, only: [:create]
      post :likes, to: 'posts/likes#create'

      collection do
        get 'search'
      end
    end
  end
  # resources :posts do
  #   resources :likes, only: [:create]
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
