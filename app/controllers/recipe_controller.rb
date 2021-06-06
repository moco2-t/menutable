class RecipeController < ApplicationController
before_action :ingredient,{only:[:category]}

def index
    
end

def search
    @search_recipe = Recipe.where('name LIKE ?', "%#{params[:searchword]}%")
    render("/recipe/index")
end

def new

end

def create
    url = params[:address] 
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html)
    @created_recipe = Recipe.new(
            name: doc.title,
            keyword: "不明",
            address: params[:address]
            )
    if @created_recipe.save
        flash[:notice]="材料を登録してください"
        redirect_to("/recipes/#{@created_recipe.id}/ingredient")
    else
        flash[:notice] = "登録に失敗しました"
        render("/recipes/new")
    end
end

def show
     
end

def ingredient
    
end

def category
    @category_id = params[:category]
    @food_category = Food.find_by(id: @category_id.to_i)
    render("recipe/ingredient")
end

def create_ingredient
    @created_ingredient = Ingredient.new(
        food_id: params[:food_id],
        amount: params[:amount],
        recipe_id: params[:id]
        )

    if @created_ingredient.save
        @created_ingredient.foodname = Food.find_by(id: params[:food_id]).name
        @created_ingredient.save
        flash[:notice] = "登録しました！"
        redirect_to("/recipes/#{params[:id]}/ingredient")
    else
        flash[:notice] = "失敗しました！"
        render("recipe/ingredient")
    end
end

def create_food
    select_category = Food.find_by(id: params[:food_category].to_i) 
    @new_food = select_category.children.new(name: params[:name])

    if @new_food.save
        flash[:notice] = "食材を新しく登録しました！"
        redirect_to("/recipes/#{params[:id]}/ingredient")
    else
        render("recipe/ingredient")
    end
end

def destroy
    destroy_recipe = Recipe.find_by(id: params[:id]).destroy
    if destroy_recipe
        flash[:notice] = "レシピを削除しました"
        redirect_to("/recipes/index")
    end
end

end