require 'open-uri'
require 'nokogiri'
require 'kconv'

module RecipesHelper
    def recipes 
        Recipe.all
    end

    def recipe 
        Recipe.find_by(id: params[:id])
    end

    def ingredients 
        Ingredient.where(recipe_id: params[:id])
    end

    def materials
        Material.where(recipe_id: params[:id])
    end

    def scraping
        recipe = Recipe.find_by(id: params[:id])
        url = recipe.address
        html = URI.open(url).read
        doc = Nokogiri::HTML.parse(html)
    end
end