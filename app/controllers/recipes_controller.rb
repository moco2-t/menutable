require "csv"
require_relative "converter.rb"
class RecipesController < ApplicationController
include Converter
    def index
    end

    def search
        @search_recipe = Recipe.where('name LIKE ?', "%#{params[:searchword]}%")
        render action: :index
    end

    def new
    end

    def create_recipe
        @url = params[:address] 
            if @url.include?("https://")
                html = URI.open(@url).read
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
                        redirect_to action: :show_food_choices, id: @created_recipe.id
                    else
                        @url_error = "URLを再度確認してください。"
                        render action: :new
                    end
            else
                @url_error = "URLを入力してください。"
                render action: :new
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
        @registered_material = Material.where(recipe_id: params[:id]) 
        @category_parent_array = ["-- category --"]
        #データベースから、親カテゴリーのみ抽出し、配列化
            Food.where(unit:nil).each do |parent|
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
        if amounts.count === food_ids.count
            food_ids.zip(amounts) do |food_id,amount| 
                @temporary_food_id = food_id
                @amount = amount
                
                quantity_conversion_branch
                
                @created_material = Material.create(
                    recipe_id: @recipe_id,
                    food_id:  @temporary_food_id,
                    quantity: @quantity
                    )
            end        
            flash[:notice]="材料登録しました"
            redirect_to "/recipes/show_food_choices/#{params[:recipe_id]}/"
        else
            flash[:error_create_materials] = "各材料１つ、チェックボックスを選択してください。"
            redirect_to "/recipes/show_food_choices/#{params[:recipe_id]}/"
        end       
    end

    def create_manual_materials
        @temporary_food_id = params[:food_id]
        @amount = params[:amount]
        case params[:kind]
        when "edit_material" then
            if  @temporary_food_id.nil?||@amount.empty? 
                redirect_to "/recipes/#{params[:recipe_id]}/edit_material",flash:{alert: '食材の選択または数量の入力がされていません。選択及び入力をしてください。'}
            else
                quantity_conversion_branch
                @created_material = Material.create(
                    recipe_id: params[:recipe_id],
                    food_id:  @temporary_food_id,
                    quantity: @quantity
                    )
                flash[:notice]="新しく「　#{Food.find_by(id:@temporary_food_id).name}　」を登録しました"
                redirect_to "/recipes/#{params[:recipe_id]}/edit_material"
            end    
        when "new_material" then
            if  @temporary_food_id.nil? ||@amount.empty? 
                redirect_to "/recipes/show_food_choices/#{params[:recipe_id]}" ,flash:{alert: '食材の選択または数量の入力がされていません。選択及び入力をしてください。'}
            else
                quantity_conversion_branch
                @created_material = Material.create(
                    recipe_id: params[:recipe_id],
                    food_id:  @temporary_food_id,
                    quantity: @quantity
                    )
                flash[:notice]="「　#{Food.find_by(id:@temporary_food_id).name}　」を登録しました"
                redirect_to "/recipes/show_food_choices/#{params[:recipe_id]}/"
            end
        end
    end

    def show
    end

    def destroy_recipe
        destroy_recipe = Recipe.find_by(id: params[:id]).destroy
        if destroy_recipe
            flash[:notice] = "レシピを削除しました"
            destroy_ingredients = Ingredient.where(recipe_id: params[:id]).destroy_all
            destroy_materials = Material.where(recipe_id: params[:id]).destroy_all
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
            render"recipes/edit_recipe"
        end
    end

    def destroy_material
        destroy_material = Material.find_by(id: params[:id]).destroy
        if destroy_material
            flash[:notice] = "削除しました"
            redirect_to("/recipes/#{params[:recipe_id]}/edit_material")
        end
    end

    def edit_material
        @category_parent_array = ["---"]
        #データベースから、親カテゴリーのみ抽出し、配列化
            Food.where(unit:nil).each do |parent|
            @category_parent_array << parent.name
            end
    end

    def update_material
        edit_material = Material.find_by(id:params[:id]) 
        if params[:quantity].empty?
            redirect_to "/recipes/#{params[:recipe_id]}/edit_material",flash:{info: '数量が空欄です。再度入力してください。'}
        elsif params[:quantity]
            edit_material.quantity = params[:quantity]
            if edit_material.save
                flash[:notice]= "変更しました"
                redirect_to("/recipes/#{params[:recipe_id]}/edit_material")
            end
        end
    end
end
