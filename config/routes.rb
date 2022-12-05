Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'recipes/get_category_children' => 'recipes#get_category_children', defaults: { format: 'json' } #Ajaxで動くアクションのルートを作成
  get 'shopping/get_category_children' => 'shopping#get_category_children', defaults: { format: 'json' } #Ajaxで動くアクションのルートを作成

  get "/" => "home#index"
  get "/about" => "home#about"
  get "/unauthenticated" => "home#unauthenticated"
  #アカウント
  get "users/login_form" => "user#login_form" 
  post "users/login" => "user#login" 
  get "users/new_account" => "user#new_account" 
  post "users/create_account" => "user#create_account"
  post "users/logout" => "user#logout"
  get "users/:id" => "user#show"
  delete "users/delete" => "user#destroy_account"
  get "users/:id/edit" => "user#edit_account"
  post "/update_account" => "user#update_account"
  #レシピ機能
  get "recipes/recipe_top" => "recipes#recipe_top" #レシピ一覧
  get "recipes/recipe_search" => "recipes#search_recipe" #レシピ検索
  get "recipes/recipe_new" => "recipes#recipe_new" #レシピ登録ページ
  post "recipes/create_recipe" => "recipes#create_recipe" #レシピ登録
  get "recipes/show_food_choices/:id" => "recipes#show_food_choices" #材料リストの設定(自動検索)
  get "recipes/show_food_choices_by_category/" => "recipes#show_food_choices_by_category" #材料リストの追加設定（手動）
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
  get "meal/menu_top" => "meal#menu_top" #献立表示
  get "meal/menu_new" => "meal#menu_new" #献立決め
  get "meal/menu_search" => "meal#menu_search" #献立用レシピ検索
  post "meal/menu_select" => "meal#menu_select" #献立用レシピ選択
  delete "meal/menu_delete" => "meal#destroy_menu" #献立削除
  #買い物リスト
  get "shopping/shopping_top" => "shopping#shopping_top" #買い物リスト
  post "shopping/search_shopping" => "shopping#search_shopping" #買い物リストの期間を指定する
  get "shopping/create_shopping_list" => "shopping#create_shopping_list" #買い物リスト作成画面
  post "shopping/sum_shopping_list" => "shopping#sum_shopping_list" #買い物リストの作成
  delete "shopping/list/delete" => "shopping#destroy" #買い物リストの削除
  get "shopping/show_shopping_list" => "shopping#show_shopping_list"#買い物リストを表示画面
  get "edit_shopping_list" => "shopping#edit_shopping_list" #買い物リスト編集画面
  post "update_shopping_list" => "shopping#update_shopping_list" #買い物リスト変更
  post "add_shopping" => "shopping#add_shopping"  #買い物リストの追加
  delete "shopping/:id/delete" => "shopping#destroy_shopping" #買い物リストの項目削除
  get "create_csv" => "shopping#create_csv" #買い物リストのCSVを作成
  
end
