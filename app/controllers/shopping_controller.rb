require'date'

class ShoppingController < ApplicationController

    def index 
    
    end

    def select_day
        @meal= Meal.where(start_date:params[:staart_date]..params[:staart_date2])
        render("shopping/select")
    end

end

    