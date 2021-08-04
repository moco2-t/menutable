class RecipeController < ApplicationController

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
        redirect_to("/recipes/#{@created_recipe.id}")
    else
        flash[:notice] = "登録に失敗しました"
        render("/recipes/new")
    end
end

def show
     
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

def update_recipe
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

end