Rails.application.routes.draw do
  get 'topics/index'
  get 'topics/show/:id' => 'topics#show' , as: :topics_show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
