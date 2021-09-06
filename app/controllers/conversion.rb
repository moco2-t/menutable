require "csv"
module Conversion
    def quantity_conversion_branch
        if @temporary_food_id === food_hash[nil] # unitがnil=調味料,牛乳
                convert_to_quantity_of_seasoning
        else
            convert_to_quantity
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

    def convert_to_quantity
        criterion_value = Food.find_by(id:@temporary_food_id).criterion.to_i
            if @amount.include?("g")
                @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/criterion_value
            elsif @amount.include?("本") or @amount.include?("合") or @amount.include?("玉") or @amount.include?("尾") or @amount.include?("個") or @amount.include?("束") or @amount.include?("袋") or @amount.include?("片") or @amount.include?("株") or @amount.include?("パック") or @amount.include?("cm")
                @quantity = Rational(@amount.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／', '0-9a-zA-Z/').delete("^0-9/","^０-９／")).to_f
            elsif @amount.include?("適量") or @amount.include?("少々") or @amount.include?("ひとつまみ")
                @quantity = 1
            else
                @quantity = nil
            end
    end

    def convert_to_quantity_of_seasoning
        @quantity = nil
    end

end
