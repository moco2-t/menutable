module ShoppingHelper

    def meals
        Meal.all
    end

    def shopping_all
        Shopping.all 
    end

    def shopping_list
        Shopping.where(start_date: params[:date]).order("food_id")
        #food_idを昇順に並び替える
    end
end
