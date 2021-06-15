require'date'
class MealController < ApplicationController
    before_action :set_recipe

    def index 
    end

    def new
    end

    def search
        @results = @search_recipes.result
        render("meal/index")
    end

    def select 
        @new_meal = Meal.new(
            start_time: params[:start_time],
            recipe_id: params[:recipe_id]
        )
        if @new_meal.save
            flash[:notice] = "メニューを登録しました"
            redirect_to("/meal/index")
        else
            render("meal/index")
        end
    end

    def edit
        
    end

    def day
        @select_meal = Meal.where(start_time: params[:start_time])
        render("meal/edit")
    end

    def destroy
        destroy_meal = Meal.find_by(id: params[:id]).destroy
        if destroy_meal
            flash[:notice] = "削除しました"
            redirect_to("/meal/edit")
        end
    end
    
    private

    def set_recipe
        @search_recipes = Recipe.ransack(params[:q]) 
        @meals = Meal.all  
    end

end
