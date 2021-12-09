require'date'
class MealController < ApplicationController
    before_action :set_recipe

    def index 
    end

    def new
    end

    def search
        @results = @search_recipes.result
        render("meal/new")
    end

    def select 
        @new_menu = Meal.new(
            start_date: params[:start_date],
            recipe_id: params[:recipe_id]
        )
        if @new_menu.save
            flash[:notice] = "メニューを登録しました"
            redirect_to("/menu/new")
        end
    end

    def edit
        
    end

    def day
        @select_menu = Meal.where(start_date: params[:start_date]..params[:start_date2])
        render("meal/edit")
    end

    def destroy
        destroyed_menu = Meal.find_by(id: params[:id]).destroy
        if destroyed_menu
            flash[:notice] = "削除しました"
            redirect_to("/menu/edit")
        end
    end
    
    private

    def set_recipe
        @search_recipes = Recipe.ransack(params[:q]) 
        @menus = Meal.all  
    end

end
