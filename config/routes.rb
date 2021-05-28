Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "index" => "home#index" #ログイン前index
  #ログイン、アカウント
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
  #レシピ機能
  get "recipes/index" => "recipe#index" #レシピ一覧
  get "recipes/new" => "recipe#new" #レシピ登録ページ
  post "recipes/create" => "recipe#create" #レシピ登録
  get "recipes/:id/ingredient" => "recipe#ingredient" #材料登録ページ
  post "recipes/:id/category" => "recipe#category" #材料カテゴリー選択
  post "recipes/:id/create_ingredient" => "recipe#create_ingredient" #材料登録
  post "recipes/:id/create_food" => "recipe#create_food" #材料追加
  
end
