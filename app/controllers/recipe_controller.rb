class RecipeController < ApplicationController

require 'open-uri'
require 'nokogiri'
require 'kconv'

before_action :recipe
before_action :ingredient,{only:[:category]}

def recipe
    @recipe = Recipe.find_by(id: params[:id])
    @ingredients = Ingredient.where(recipe_id: params[:id]) 

end

def index
    @recipes = Recipe.all
end

def search
    @search_recipe = Recipe.where(name: params[:recipe_key])
    render("/recipe/index")
end

def new

end

def create
    url = params[:address]
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html) #取得したhtmlをNokogiriでパースする
    
    @create_recipe = Recipe.new(
            name: doc.title,
            keyword: "不明",
            address: params[:address]
            )

    if @create_recipe.save
        flash[:notice]="材料を登録してください"
        redirect_to("/recipes/ingredient")
    else
        flash[:notice] = "登録に失敗しました"
        render("/recipes/new")
    end
end

def ingredient
    @newrecipe= Recipe.last
    url = @newrecipe.address
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html) #取得したhtmlをNokogiriでパースする
    @scraping_ingredient = doc.css('.name').children 
    @scraping_amount = doc.css('.ingredient_quantity')
    @ingredient = Ingredient.where(recipe_id: @newrecipe.id)
end

def category
    category_id = params[:category]
    @food_category = Food.find_by(id: category_id.to_i)
    render("recipe/ingredient")
end

def create_ingredient
    @newingredient = Ingredient.new(
        recipe_id: Recipe.last.id,
        food_id: params[:food_id],
        amount: params[:amount]
    )
    if @newingredient.save
        flash[:notice] = "登録しました！"
        redirect_to("/recipes/ingredient")
    else
        flash[:notice] = "失敗しました！"
        render("recipe#category")
    end
end

def create_food
    @select_category =Food.find_by(id:params[:food_category].to_i) 
    @new_food = @select_category.children.new(name: params[:name])
   
    if @new_food.save
        flash[:notice] = "食材を新しく登録しました！"
        redirect_to("/recipes/ingredient")
    else
        render("recipe/ingredient")
    end
end

def show
    @ingredients = Ingredient.where(recipe_id: params[:id]) 
end

def edit
   ingredient_foodname =  @ingredients.each{|i| puts Food.find_by(id: i.food_id).name}

end  

def update
    render plain: params.inspect
   
end

def update_category
    category_id = params[:category]
    @food_category = Food.find_by(id: category_id.to_i)
    render("recipe/edit")
end

def update_ingredient

end


end


#render plain: params.inspect paramsの内容確認