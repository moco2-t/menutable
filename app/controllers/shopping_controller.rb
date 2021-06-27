require'date'

class ShoppingController < ApplicationController

    def index 
    
    end

    def create
        @date = params[:day_start]..params[:day_end]
        meals=Meal.where(start_time:@date).pluck(:recipe_id)
        #登録した期間の献立の全材料
        @ingredients = Ingredient.where(recipe_id: meals)
        if @ingredients.group(:food_id).having('count(*) >= 2')
            #単独の材料のfood_id            
            @single = @ingredients.group(:food_id).having('count(*) = 1').pluck(:id)            
            #単独の材料を保存
            @single.each do |s| 
                shopping_single = Shopping.new(
                    date: @date,
                    ingredient_id: s,
                    amount: @ingredients.where(id: s).pluck(:amount).to_s
                )
                shopping_single.save
            end
            #重複している材料のfood_id
            @overlapping = @ingredients.group(:food_id).having('count(*) >= 2').pluck(:id)
            #重複している材料を保存
            @overlapping.each do |o| 
                shopping_overlapping= Shopping.new(
                    date: @date,
                    ingredient_id: o,
                    amount: @ingredients.where(id: o).pluck(:amount).to_s
                )
                shopping_overlapping.save
            end
        end
        redirect_to("/shopping/list")
    end

    def list
        
    end

    def check_list
    
    end

    def edit
        
    end

    def update
        
    end

    def delete
        
    end
end
