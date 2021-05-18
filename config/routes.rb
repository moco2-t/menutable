Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "index" => "home#index" #ログイン前index
  #user
  get "users/login_form" => "user#login_form" #ログイン画面
  post "users/login" => "user#login" #ログインform
  post "logout" => "user#logout" #ログアウト
  get "users/new" => "user#new" #アカウント登録画面
  post "users/create" => "user#create" #アカウント登録form
  get "users/top" => "user#top" #ログイン後top画面
  get "users/:id" => "user#show" #アカウント詳細
  delete "/users/delete" => "user#destroy" #アカウント削除
  get "users/:id/edit" => "user#edit" #アカウント編集
  post "users/update" => "user#update" #アカウント編集form

  get "recipes/index" => "recipe#index" #レシピ一覧
  get "recipes/new" => "recipe#new"
  
end
