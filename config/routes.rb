Rails.application.routes.draw do
  root 'topics#index'

  # get 'topics/index'
  resources :topics, only: [:index, :show, :new] do
    resources :posts, only: [:show, :edit, :update, :create], module: :topics
  end

  # get 'topics/show/:id' => 'topics#show', as: :topics_show
  # get 'topics/:id' => 'topics#show'
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
  get 'topics/show/posts/edit' => 'topics#edit'

  # post 'posts/create' => 'posts#create'
  # post 'posts/:id/update' => 'posts#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
