Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  resources :tweets, only: [:index] do
    collection do #http://localhost:3000/tweets/notification のように「別のページ」を作ることができる
      get "create"
      get "notification"
      get "topic"
      get "message"
      get "bookmark"
      get "list"
      get "profile"
      get "info"
    end
  end

end
