Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  resources :tweets, only: [:index] do
    collection do         #　collection do ~end
      get "create"        # "http://localhost:3000/tweets/notification" のように　
      get "notification"  #　「別のページ」を作ることができる。ただしidは取れない。
      get "topic"
      get "message"
      get "bookmark"
      get "list"
      get "profile"
      get "info"
    end#of_collection
    member do             # member do ~end
      get "like"          # "http://localhost:3000/tweets/:id/like" のように
    end#of_member         # params[:id]を受け取ることができる
  end#of_resources_tweets
  resources :users, only: [:show]
end
