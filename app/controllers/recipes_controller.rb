require "csv"
require_relative "Conversion"
class RecipesController < ApplicationController
include Conversion
    def indexs
    end

    def search
        @search_recipe = Recipe.where('name LIKE ?', "%#{params[:searchword]}%")
        render("/recipes/index")
    end

    def new
    end

    def create_recipe
        url = params[:address] 
        html = URI.open(url).read
        doc = Nokogiri::HTML.parse(html)
        doc_name = doc.css('.name')
        doc_amount = doc.css('.amount')
        @created_recipe = Recipe.new(
                name: doc.title,
                keyword: "不明",
                address: params[:address]
                )   
        if @created_recipe.save
            doc_name.zip(doc_amount) do |n,a|
                @created_ingredient = Ingredient.new(
                    foodname: n.text.delete("■,●,◎,○,\n, ,★,☆"),
                    amount: a.text.delete("■,●,◎,○,\n, ,★,☆"),
                    recipe_id: @created_recipe.id
                    )
                @created_ingredient.save
            end
            flash[:notice]="登録"
            redirect_to("/recipes/show_food_choices/#{@created_recipe.id}/")
        else
            flash[:notice] = "登録に失敗しました"
            render("/recipes/new")
        end
    end

    def show_food_choices
        @ingredients= Ingredient.where(recipe_id: params[:id])
        @automaticsearch_ingredients = []
        @ingredients.each do |m|
            @food=Food.where("name LIKE ? OR keyword LIKE ?","%#{m.foodname}%","%#{m.foodname}%")
                unless @food.blank?
                    @automaticsearch_ingredients << m.amount    #foodテーブルに該当するもの
                end
        end
    end

    def show_food_choices_by_category
        @ingredients= Ingredient.where(recipe_id:params[:id])
        @registered_material = Material.where(recipe_id: params[:id]) 
        @category_parent_array = ["---"]
        #データベースから、親カテゴリーのみ抽出し、配列化
            Food.where(id:1..14).each do |parent|
            @category_parent_array << parent.name
            end
    end

    def get_category_children
        #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
        @category_children = Food.find_by(name: params[:category]).children
    end

    def create_materials #materialレコードの作成
        @recipe_id = params[:recipe_id]
        food_ids = params[:food_ids]
        amounts = params[:amounts].split
        if food_ids
            food_ids.zip(amounts) do |food_id,amount| 
                @temporary_food_id = food_id
                @amount = amount
                
                quantity_conversion_branch #module_Choicesからメソッド呼び出し
                
                @created_material = Material.create(
                    recipe_id: @recipe_id,
                    food_id:  @temporary_food_id,
                    quantity: @quantity,
                    unit: Food.find_by(id:@temporary_food_id).unit
                    )
            end        
            flash[:notice]="登録"
            redirect_to recipes_show_food_choices_by_category_path(id:params[:recipe_id])
        else
            flash[:notice] = "登録に失敗しました"
            render("recipes#show_food_choices")
        end       
    end

    def create_manual_materials
        @temporary_food_id = params[:food_id]
        @amount = params[:amount]

        quantity_conversion_branch
        
        @created_material = Material.create(
            recipe_id: params[:recipe_id],
            food_id:  params[:food_id],
            quantity: @quantity,
            unit: Food.find_by(id:params[:food_id]).unit
            )
        flash[:notice]="登録"
        redirect_to recipes_show_food_choices_by_category_path(id:params[:recipe_id])
    end

    def show
    end

    def destroy_recipe
        destroy_recipe = Recipe.find_by(id: params[:id]).destroy
        if destroy_recipe
            flash[:notice] = "レシピを削除しました"
            redirect_to("/recipes/index")
        end
    end

    def edit_recipe
    end

    def update_recipe
        @edit_recipe = Recipe.find_by(id: params[:id])
        @edit_recipe.name = params[:name]
        @edit_recipe.keyword = params[:keyword]
        @edit_recipe.address = params[:address]
        if @edit_recipe.save
            flash[:notice]= "変更しました"
            redirect_to("/recipes/#{params[:id]}")
        else
            render("recipes#edit_recipe")
        end
    end

    def destroy_material
        
    end

    def edit_material
    end

    def update_material
    end

end


