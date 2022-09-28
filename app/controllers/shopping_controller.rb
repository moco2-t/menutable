require'date'
require 'csv'
require_relative "converter.rb"
class ShoppingController < ApplicationController
include Converter

    def index 
        @menus = Meal.all
    end

    def create_shopping_list
        @menus = Meal.all
    end

    def sum_shopping_list
        menu=Meal.where(start_date:params[:start_date]..params[:start_date2])
        menu_recipe_id = []
            menu.each do |m|
                menu_recipe_id << m.recipe_id
            end 
        menu_recipe_id

        material_list = Material.where(recipe_id:menu_recipe_id)
        @materials = material_list.group_by{|i| i.food_id}.select{|k,v| v.one?}.keys 
        @duplicate_materials = material_list.group_by{|i| i.food_id}.reject{|k,v| v.one?}.keys #重複している食材のfood_idの配列
        @materials.each do |i_id|
            Material.where(recipe_id:menu_recipe_id,food_id:i_id).each do |material|
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
                quantities=Material.where(recipe_id:menu_recipe_id,food_id:duplicate).pluck(:quantity)
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
        if params[:start_date]&&params[:end_date] 
            redirect_to shopping_show_shopping_list_path(start_date:params[:start_date],end_date:params[:end_date])
        end
    end

    def edit_shopping_list
        @category_parent_array = ["--category--"]
        #データベースから、親カテゴリーのみ抽出し、配列化
            Food.where(unit:nil).each do |parent|
            @category_parent_array << parent.name
            end
    end

    def get_category_children
        #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
        @category_children = Food.find_by(name: params[:category]).children
    end

    def update_shopping_list
        @edit_shopping =Shopping.find_by(id: params[:id])
        @edit_shopping.quantity = params[:quantity]
        if @edit_shopping.save
            flash[:notice]= "#{Food.find_by(id:@edit_shopping.food_id)[:name]}の数量を変更しました"
            redirect_to shopping_edit_shopping_list_path(start_date:params[:start_date],end_date:params[:end_date])
        else
            flash[:notice]="登録失敗"
            redirect_to shopping_edit_shopping_list_path(start_date:params[:start_date],end_date:params[:end_date])
        end
    end

    def destroy_shopping
        destroy_shopping = Shopping.find_by(id: params[:id]).destroy
        if destroy_shopping
            flash[:notice] = "買い物リストの項目を削除しました"
            redirect_to shopping_edit_shopping_list_path(start_date:params[:start_date],end_date:params[:end_date])
        end
    end

    def add_shopping
        @amount = params[:amount]
        @temporary_food_id = params[:food_id]
        quantity_conversion_branch
        shopping_item= Shopping.new(
            start_date: params[:start_date],
            end_date: params[:end_date],
            food_id: params[:food_id],
            quantity: @quantity ,
            unit: Food.find_by(id:params[:food_id])[:unit]
            )
        if shopping_item.save
            flash[:notice]="#{params[:start_date]}~#{params[:end_date]}の買い物リストを追加しました"
            redirect_to shopping_edit_shopping_list_path(start_date:params[:start_date],end_date:params[:end_date])
        else
            flash[:notice]="登録失敗"
            redirect_to shopping_edit_shopping_list_path(start_date:params[:start_date],end_date:params[:end_date])
        end
    end
    
    def create_csv
        shopping_food = Shopping.where(start_date: params[:start_date],end_date:params[:end_date],food_id:15..181).order("food_id")
        shopping_seasoning = Shopping.where(start_date: params[:start_date],end_date:params[:end_date],food_id:182..224).order("food_id")
        csv_shopping_list = shopping_food + shopping_seasoning
            respond_to do |format|
                format.html
                format.csv do |csv|
                    send_csv_shopping_list(csv_shopping_list)
                end
            end
    end

    def send_csv_shopping_list(csv_shopping_list)
        csv_data = CSV.generate do |csv|
            column_names = %w(名前,,)
            csv << column_names
            csv_shopping_list.each do |item|
                if item.unit != "none"
                    column_values = [
                        Food.find_by(id:item.food_id)[:name],
                        item.quantity,
                        item.unit
                        ]
                else
                    column_values = [
                        Food.find_by(id:item.food_id)[:name],
                        "",
                        ""
                        ]
                end
                csv << column_values
            end
        end
        send_data(csv_data, filename: "買い物リスト.csv")
    end

end


    