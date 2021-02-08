Rails.application.routes.draw do
  root  'topics#index'
  get 'topics/index'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  post 'posts/create' => 'post#create', as: :post_create
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
