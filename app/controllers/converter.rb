require "csv"
module Converter
    def quantity_conversion_branch
        @gen_amount = @amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
        if @temporary_food_id === food_hash_unit["none"] # unitがnil=調味料,牛乳
            quantity_conversion_of_seasonings
        elsif @temporary_food_id === food_hash["キャベツ"]&&@amount.include?("枚")
            quantity_conversion_cabbage
        elsif @temporary_food_id === food_hash["鶏むね肉"]&&@amount.include?("枚")||food_hash["鶏もも肉"]&&@amount.include?("枚")
            quantity_conversion_chicken_breast
        else
            quantity_conversion
        end
    end

    def food_hash_unit
        @food_hash_unit ||= gen_food_hash_unit
    end

    def gen_food_hash_unit
        path = File.join(Rails.root, "db", "food.csv")
        t = CSV.read(path)
        food_hash_unit = {}
        t.each_with_index do |row, idx|
            if idx == 0
            next
            end
            food_hash_unit[row[2]] = row[0]
        end
        food_hash_unit
    end

    def food_hash
        @food_hash ||= gen_food_hash
    end

    def gen_food_hash
        path = File.join(Rails.root, "db", "food.csv")
        t = CSV.read(path)
        food_hash = {}
        t.each_with_index do |row, idx|
            if idx == 0
            next
            end
            food_hash[row[1]] = row[0]
        end
        food_hash
    end

    def quantity_conversion
        criterion_value = Food.find_by(id:@temporary_food_id).criterion.to_f
        if @amount.include?("g")||@amount.include?("グラム")
            if @amount.include?("~")||@amount.include?("〜") 
                @quantity = Rational(@gen_amount.sub!(/~.*/m,"")).to_f/criterion_value        
            else
                @quantity = Rational(@gen_amount).to_f/criterion_value
            end
        elsif @amount.include?("本")||@amount.include?("合")||@amount.include?("玉")||@amount.include?("尾")||@amount.include?("個")||@amount.include?("束")||@amount.include?("袋")||@amount.include?("片")||@amount.include?("株")||@amount.include?("パック")||@amount.include?("切れ")||@amount.include?("枚")||@amount.include?("切")
            if @amount.include?("~")||@amount.include?("〜")
                @quantity = Rational(@gen_amount.sub!(/~.*/m,"")).to_f
            else
                @quantity = Rational(@gen_amount).to_f
            end
        elsif @amount.include?("適量")||@amount.include?("少々")||@amount.include?("ひとつまみ")
            @quantity = nil
        else
            @quantity = nil
        end
    end

    def quantity_conversion_of_seasonings
        @quantity = nil
    end

    def quantity_conversion_cabbage
        if @amount.include?("~")||@amount.include?("〜")
            @quantity = Rational(@gen_amount.sub!(/~.*/m,"")).to_f*23/1200
        else
            @quantity = Rational(@gen_amount).to_f*23/1200
        end
    end

    def quantity_conversion_chicken_breast
        if @amount.include?("~")||@amount.include?("〜")
            @quantity = Rational(@gen_amount.sub!(/~.*/m,"")).to_f*250
        else
            @quantity = Rational(@gen_amount).to_f*250
        end
    end

end

