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

def edit
    
end

def r_update
    @edit_recipe = Recipe.find_by(id: params[:id])
    @edit_recipe.name = params[:name]
    @edit_recipe.keyword = params[:keyword]
    @edit_recipe.address = params[:address]
    if @edit_recipe.save
        flash[:notice]= "変更しました"
        redirect_to("/recipes/#{params[:id]}")
    else
        render("recipe/edit")
    end
end

def ingredient_edit
    
end

def i_update
    @edit_ingredient = Ingredient.find_by(id: params[:ingredient_id])
    @edit_ingredient.amount = params[:amount]
    if @edit_ingredient.save
        flash[:notice]= "分量を変更しました"
        render("recipe/ingredient_edit")
    else
        render("recipe/ingredient_edit")
    end
end

def edit_category
    @category_id = params[:category]
    @food_category = Food.find_by(id: @category_id.to_i)
    render("recipe/ingredient_edit")
end

def edit_create_ingredient
    @created_ingredient = Ingredient.new(
        food_id: params[:food_id],
        amount: params[:amount],
        recipe_id: params[:id]
        )
    if @created_ingredient.save
        @created_ingredient.foodname = Food.find_by(id: params[:food_id]).name
        @created_ingredient.save
        flash[:notice] = "登録しました！"
        redirect_to("/recipes/#{params[:id]}/ingredient_edit")
    else
        render("recipe/ingredient_edit")
    end
end

def i_destroy
    destroy_ingredient = Ingredient.find_by(id: params[:ingredient_id]).destroy
    if destroy_ingredient
        flash[:notice] = "材料を削除しました"
        redirect_to("/recipes/#{params[:id]}/ingredient_edit")
    end
end

end