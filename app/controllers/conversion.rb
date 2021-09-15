require "csv"
module Conversion
    def quantity_conversion_branch
        if @temporary_food_id === food_hash["none"] # unitがnil=調味料,牛乳
            quantity_conversion_of_seasonings
        elsif @temporary_food_id === "23"&&@amount.include?("枚")
            quantity_conversion_cabbage
        elsif @temporary_food_id === "102"&&@amount.include?("枚")
            quantity_conversion_chicken_breast
        else
            quantity_conversion
        end
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
            food_hash[row[1]] = row[2]
        end
        food_hash
    end

    def quantity_conversion
        criterion_value = Food.find_by(id:@temporary_food_id).criterion.to_f
        if @amount.include?("g")||@amount.include?("グラム")
            if @amount.include?("~")||@amount.include?("〜") 
                @quantity = Rational(@amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜").sub!(/~.*/m,"")).to_f/criterion_value        
            else
                @quantity = Rational(@amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")).to_f/criterion_value
            end
        elsif @amount.include?("本")||@amount.include?("合")||@amount.include?("玉")||@amount.include?("尾")||@amount.include?("個")||@amount.include?("束")||@amount.include?("袋")||@amount.include?("片")||@amount.include?("株")||@amount.include?("パック")||@amount.include?("切れ")||@amount.include?("枚")||@amount.include?("切")
            if @amount.include?("~")||@amount.include?("〜")
                @quantity = Rational(@amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜").sub!(/~.*/m,"")).to_f
            else
                @quantity = Rational(@amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")).to_f
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
            @quantity = Rational(@amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜").sub!(/~.*/m,"")).to_f*23/1200
        else
            @quantity = Rational(@amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")).to_f*23/1200
        end
    end

    def quantity_conversion_chicken_breast
        if @amount.include?("~")||@amount.include?("〜")
            @quantity = Rational(@amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜").sub!(/~.*/m,"")).to_f*250
        else
            @quantity = Rational(@amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")).to_f*250
        end
    end

end

