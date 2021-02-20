Rails.application.routes.draw do
  root 'topics#index'
  resources :topics, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:show, :edit, :update, :create], module: :topics do
      post :likes, to: 'posts/likes#create'

      collection do
        get 'search'
      end
    end
  end
end
