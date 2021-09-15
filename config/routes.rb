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
  get "recipes/index" => "recipes#index" #レシピ一覧
  get "recipes/search" => "recipes#search" #レシピ検索
  get "recipes/new" => "recipes#new" #レシピ登録ページ
  post "recipes/create_recipe" => "recipes#create_recipe" #レシピ登録
  get "recipes/show_food_choices/:id/" => "recipes#show_food_choices" #材料リストの設定(自動検索)
  get "recipes/show_food_choices_by_category/" => "recipes#show_food_choices_by_category" #材料リストの追加設定（手動）
  get 'recipes/show_food_choices_by_category/get_category_children' => "recipes#get_category_children", defaults: { format: 'json' } #Ajaxで動くアクションのルートを作成
  post "recipes/create_materials" => "recipes#create_materials" #材料リストの登録
  post "recipes/create_manual_materials" => "recipes#create_manual_materials" #材料リストの追加登録
  get "recipes/:id" => "recipes#show" #レシピと材料リストの詳細
  delete "recipes/:id/delete" => "recipes#destroy_recipe" #レシピ削除
  get "recipes/:id/edit_recipe" => "recipes#edit_recipe" #レシピ編集
  post "recipes/:id/update_recipe" => "recipes#update_recipe" #レシピ更新
  delete "recipes/material/:id/delete" => "recipes#destroy_material" #材料リストの削除
  get "recipes/:id/edit_material" => "recipes#edit_material" #材料リストの編集
  post "recipes/:id/update_material" => "recipes#update_material" #材料リストの更新

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
  post "shopping/view" => "shopping#view" #買い物リストの期間を指定する
  get "shopping/create_shopping_list" => "shopping#create_shopping_list" #買い物リスト作成ページ
  post "shopping/sum_shopping_list" => "shopping#sum_shopping_list" #買い物リストの合算
  get "shopping/show_shopping_list" => "shopping#show_shopping_list"#買い物リストを表示
end
