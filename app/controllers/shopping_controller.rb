require'date'
class ShoppingController < ApplicationController

    def index 
        @meals = Meal.all  
    end

    def create_shopping_list
        @meals = Meal.all
    end

    def sum_shopping_list
        meal=Meal.where(start_date:params[:start_date]..params[:start_date2])
        
        meal_recipe_id = []
            meal.each do |m|
                meal_recipe_id << m.recipe_id
            end 
        meal_recipe_id

        material_list = Material.where(recipe_id:meal_recipe_id)
        @materials = material_list.group_by{|i| i.food_id}.select{|k,v| v.one?}.keys 
        @duplicate_materials = material_list.group_by{|i| i.food_id}.reject{|k,v| v.one?}.keys #重複している食材のfood_idの配列
        
        @materials.each do |i_id|
            Material.where(recipe_id:meal_recipe_id,food_id:i_id).each do |material|

                shopping_item= Shopping.new(
                    start_date: params[:start_date],
                    end_date: params[:start_date2],
                    food_id: i_id,
                    quantity: material.quantity ,
                    unit: Food.find_by(id:i_id)[:unit]
                    )
                shopping_item.save
            end
        end

        if @duplicate_materials
            @duplicate_materials.each do |duplicate|
                quantities=Material.where(recipe_id:meal_recipe_id,food_id:duplicate).pluck(:quantity)
                    unless quantities.include?(nil)
                        sum_quantity = quantities.sum #分量の合計
                    else
                        sum_quantity = 0
                    end
                
                    if Food.find_by(id:duplicate)[:unit] === "none"
                        item_unit = nil
                    else
                        item_unit = Food.find_by(id:duplicate)[:unit]
                    end

                duplicate_shopping_item = Shopping.new(
                    start_date: params[:start_date],
                    end_date: params[:start_date2],
                    food_id: duplicate,
                    quantity:  sum_quantity,
                    unit: Food.find_by(id:duplicate)[:unit]
                    )
                duplicate_shopping_item.save
            end
        end
    
        flash[:notice]="#{params[:start_date]}~#{params[:start_date2]}の買い物リストを作成しました"
        redirect_to shopping_show_shopping_list_path(start_date:params[:start_date],end_date:params[:start_date2])
    end

    def show_shopping_list

    end

    def view
        redirect_to shopping_show_shopping_list_path(start_date:params[:start_date],end_date:params[:end_date])
    end

    
end


    