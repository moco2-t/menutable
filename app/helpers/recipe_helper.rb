require 'open-uri'
require 'nokogiri'
require 'kconv'

module RecipeHelper
    def recipes 
        Recipe.all
    end

    def recipe 
        Recipe.find_by(id: params[:id])
    end

    def ingredients 
        Ingredient.where(recipe_id: params[:id])
    end

    def food_category 
        Food.find_by(id: @category_id.to_i)
    end

    def scraping
        recipe = Recipe.find_by(id: params[:id])
        url = recipe.address
        html = URI.open(url).read
        doc = Nokogiri::HTML.parse(html)  
    end
end
