module ShoppingHelper

    def meals
        Meal.all
    end

    def shopping_all
        Shopping.all 
    end

    def shopping_list
        Shopping.where(start_date: params[:start_date],end_date:params[:end_date],food_id:15..181).order("food_id")
        #food_idを昇順
    end

    def shopping_seasoning
        Shopping.where(start_date: params[:start_date],end_date:params[:end_date],food_id:182..224).order("food_id")
    end
end
