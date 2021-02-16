Rails.application.routes.draw do
  root 'topics#index'
  # get 'topics/index'
  resources :topics, only: [:index, :show, :new] do
    resources :posts, only: [:show, :edit, :update, :create], module: :topics
  end

  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete

  resources :posts do
    collection do
      get 'search'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
