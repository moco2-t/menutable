require'date'
class MealController < ApplicationController
    before_action :set_recipe

    def menu_top 
    end

    def menu_new
        @results = @search_recipes.result
    end

    def menu_search
        @results = @search_recipes.result
        render("meal/menu_new")
    end

    def menu_select 
        @new_menu = Meal.new(
            start_date: params[:start_date],
            recipe_id: params[:recipe_id]
        )
        if @new_menu.save
            flash[:notice] = "メニューを登録しました"
            redirect_to("/meal/menu_new")
       else
            flash[:new_menu_error] = "日付選択されていません。日付を選択してください。"
            redirect_to("/meal/menu_new")
       end
    end

    def destroy_menu
        destroyed_menu = Meal.find_by(id: params[:id]).destroy
        if destroyed_menu
            flash[:notice] = "#{destroyed_menu.start_date}のメニュー【#{Recipe.find_by(id:destroyed_menu.recipe_id).name}】を削除しました"
            redirect_to("/meal/menu_new")
        end
    end
    
    private

    def set_recipe
        @search_recipes = Recipe.ransack(params[:q]) 
        @menus = Meal.all  
    end

end
