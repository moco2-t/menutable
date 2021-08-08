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
  get "recipes/search" => "recipe#search" #レシピ検索
  get "recipes/new" => "recipe#new" #レシピ登録ページ
  post "recipes/create" => "recipe#create" #レシピ登録
  get "recipes/:id" => "recipe#show" #レシピ詳細
  delete "recipes/:id/delete" => "recipe#destroy" #レシピ削除
  get "recipes/:id/edit" => "recipe#edit" #レシピ編集
  post "recipes/:id/update_recipe" => "recipe#update_recipe" #レシピ編集form
  #献立機能
  get "meal/index" => "meal#index" #献立表示
  get "meal/new" => "meal#new" #献立決め
  get "meal/search" => "meal#search" #献立用レシピ検索
  post "meal/select" => "meal#select" #献立用レシピ選択
  get "meal/edit" => "meal#edit" #献立編集
  post "meal/day" => "meal#day" #日付選択
  delete "meal/delete" => "meal#destroy" #献立削除
  #買い物リスト
  get "shopping/index" => "shopping#index" #買い物リスト
  post "shopping/create" => "shopping#create" #買い物リストの作成
  get "shopping/list" => "shopping#list" #買い物リスト一覧
  get "shopping/check_list" => "shopping#check_list" #買い物理リスト確認
  get "shopping/edit" => "shopping#edit" #買い物リスト編集
  post "shopping/update" => "shopping#update" #買い物リスト更新
  delete "shopping/delete" => "recipe#destroy" #買い物リスト削除

  
end
