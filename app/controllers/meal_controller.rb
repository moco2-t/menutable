class MealController < ApplicationController
    
    def index 
        
    end

    def search
        search_recipes = Recipe.ransack(params[:keyword])
        @results = search_recipes.result
        
    end

    def select 

    end

end
