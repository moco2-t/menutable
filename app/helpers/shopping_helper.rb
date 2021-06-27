module ShoppingHelper

    def meals
        Meal.all
    end

    def shopping_all
        Shopping.all 
    end

    def shopping_list
        Shopping.where(date: params[:date])
    end
end
