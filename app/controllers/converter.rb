require "csv"
module Converter

    def quantity_conversion_branch
        @gen_amount = @amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
        food_unit = Food.find_by(id:@temporary_food_id).unit
        case @temporary_food_id
            when '23' then #キャベツ
                quantity_conversion_cabbage
            when '101' || '102' then #鶏むね肉、鶏もも肉 
                quantity_conversion_chicken_breast
            else
                basic_quantity_conversion
        end
    end

    def basic_quantity_conversion
        food_unit = Food.find_by(id:@temporary_food_id).unit
        criterion_value = Food.find_by(id:@temporary_food_id).criterion.to_f
        if food_unit == "none"
            @quantity = nil
        else
            if @amount.include?("g") || @amount.include?("ｇ") || @amount.include?("グラム")
                if @amount.include?("~") || @amount.include?("〜") 
                    @quantity = (Rational(@gen_amount.sub!(/~.*/m,""))/criterion_value.to_f).floor(2)      
                else
                    @quantity = (Rational(@gen_amount).to_f/criterion_value.to_f).floor(2)
                end
            elsif @amount.include?("適量") || @amount.include?("少々") || @amount.include?("ひとつまみ")
                @quantity = nil
            elsif @amount.include?("本") || @amount.include?("個") || @amount.include?("枚") || @amount.include?("玉") || @amount.include?("束") || @amount.include?("合") || @amount.include?("杯") || @amount.include?("尾") || @amount.include?("切") || @amount.include?("片") || @amount.include?("袋") || @amount.include?("株") || @amount.include?("かけ")
                if @amount.include?("~") || @amount.include?("〜") 
                    @quantity = (Rational(@gen_amount.sub!(/~.*/m,"")).to_f).floor(2)      
                else
                    @quantity = (Rational(@gen_amount).to_f).floor(2)
                end
            end
        end
    end

    def quantity_conversion_of_seasonings
        @quantity = nil
    end

    def quantity_conversion_cabbage
        criterion_value = Food.find_by(id:@temporary_food_id).criterion.to_f
        if @amount.include?("枚")
            if @amount.include?("~") || @amount.include?("〜")
                @quantity = (Rational(@gen_amount.sub!(/~.*/m,""))*23/1200.to_f).floor(2)
            else
                @quantity = (Rational(@gen_amount)*23/1200.to_f).floor(2)
            end
        elsif @amount.include?("g") || @amount.include?("ｇ") || @amount.include?("グラム")
            if @amount.include?("~") || @amount.include?("〜")
                @quantity = (Rational(@gen_amount.sub!(/~.*/m,""))/criterion_value.to_f).floor(2)
            else
                @quantity = (Rational(@gen_amount)/criterion_value.to_f).floor(2)
            end
        else 
            if @amount.include?("~") || @amount.include?("〜")
                @quantity = (Rational(@gen_amount.sub!(/~.*/m,"")).to_f).floor(2)
            else
                @quantity = (Rational(@gen_amount).to_f).floor(2)
            end
        end
    end

    def quantity_conversion_chicken_breast
        criterion_value = Food.find_by(id:@temporary_food_id).criterion.to_f
        if @amount.include?("枚")
            if @amount.include?("~") || @amount.include?("〜")
                @quantity = (Rational(@gen_amount.sub!(/~.*/m,"")).to_f*250.to_f).floor(2)
            else
                @quantity = (Rational(@gen_amount).to_f*250.to_f).floor(2)
            end
        elsif @amount.include?("g") || @amount.include?("ｇ") || @amount.include?("グラム")
            if @amount.include?("~") || @amount.include?("〜")
                @quantity = (Rational(@gen_amount.sub!(/~.*/m,""))/criterion_value.to_f).floor(2)
            else
                @quantity = (Rational(@gen_amount)/criterion_value.to_f).floor(2)
            end
        end
    end

end
