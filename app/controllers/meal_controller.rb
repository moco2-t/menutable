require'date'
class MealController < ApplicationController
    before_action :set_recipe

    def index 
    end

    def search
        @results = @search_recipes.result
        render("meal/index")
    end

    def select 
        new_meal = Meal.new(
            start_time: params[:start_time],
            recipe_id: params[:recipe_id]
        )
        if new_meal.save
            flash[:notice] = "メニューを登録しました"
            redirect_to("/meal/index")
        else
            flash[:notice] = "登録失敗"
            render("meal/index")
        end
    end

    private

    def set_recipe
        @search_recipes = Recipe.ransack(params[:q]) 
        @results = @search_recipes.result
        @meals = Meal.all  
    end

end
