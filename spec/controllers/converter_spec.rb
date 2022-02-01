
RSpec.describe '分量計算' do
    #quantity_conversion_branch => quantity_conversion
    let!(:criterion_value){40}
    let!(:criterion_value2){1200}
    let!(:criterion_value3){1}
    context "@temporary_food_idのunitがnoneでないまたはfood_hashに'キャベツ''鶏むね肉''鶏もも肉'を含まない場合" do
        context "@amountに”g”または”グラム”が含まれる場合" do
            context "@amountに”~”または”〜”が含まれる場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount1 = "２５０g〜３００g"
                    gen_amount = amount1.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount.sub!(/~.*/m,""))/criterion_value.to_f).floor(2)
                    expect(quantity).to eq 6.25
                end
            end
            context "@amountに”~”または”〜”が含まれない場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount2 = "300g"
                    gen_amount = amount2.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount).to_f/criterion_value.to_f).floor(2)
                    expect(quantity).to eq 7.50
                end
            end
        end 
        context "@amountに'適量'または'少々'または'ひとつまみ'が含まれる場合" do
            it "@quantityはnillとなる" do
                quantity = nil
                expect(quantity).to eq nil
            end            
        end
        context "@amountに”g”または”グラム”以外の単位の場合" do
            context "@amountに”~”または”〜”が含まれる場合" do
                it  'quntityは小数点以下２桁の値となる' do 
                    amount3 = '３〜５本'
                    gen_amount = amount3.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount.sub!(/~.*/m,"")).to_f).floor(2)
                    expect(quantity).to eq 3.00
                end
            end
            context "@amountに”~”または”〜”が含まれない場合" do
                it 'quntityは小数点以下２桁の値となる' do
                    amount4 = '4本'
                    gen_amount = amount4.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount).to_f).floor(2)
                    expect(quantity).to eq 4.00
                end
            end    
        end
    end


    #quantity_conversion_branch => quantity_conversion_of_seasonings
    context "@temporary_food_idのunitがnoneの場合" do
        it "@quantityはnillとなる" do
            quantity = nil
            expect(quantity).to eq nil
        end
    end

    #quantity_conversion_branch => quantity_conversion_cabbage
    context "food_hashが'キャベツ'の場合" do
        context "@amountに'枚'が含まれる場合" do
            context "@amountに”~”または”〜”が含まれる場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount5 = '2~3枚'
                    gen_amount = amount5.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount.sub!(/~.*/m,""))*23/1200.to_f).floor(2)
                    expect(quantity).to eq 0.03
                end
            end
            context "@amountに”~”または”〜”が含まれない場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount6 = '5枚'
                    gen_amount = amount6.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount)*23/1200.to_f).floor(2)
                    expect(quantity).to eq 0.09
                end
            end
        end
        context "@amountに'g'または'グラム'が含まれる場合" do
            context "@amountに”~”または”〜”が含まれる場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount7 = "500~600g"
                    gen_amount = amount7.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount.sub!(/~.*/m,""))/criterion_value2.to_f).floor(2)
                    expect(quantity).to eq 0.41
                end
            end
            context "@amountに”~”または”〜”が含まれない場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount8 = "150g"
                    gen_amount = amount8.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount)/criterion_value2.to_f).floor(2)
                    expect(quantity).to eq 0.12
                end
            end
        end
        context "@amountに'g''グラム''枚'が含まれない場合" do
            context "@amountに”~”または”〜”が含まれる場合" do
                it  'quntityは小数点以下２桁の値となる' do 
                    amount9 = '1/4~1/2個'
                    gen_amount = amount9.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount.sub!(/~.*/m,"")).to_f).floor(2)
                    expect(quantity).to eq 0.25
                end
            end
            context "@amountに”~”または”〜”が含まれない場合" do
                it 'quntityは小数点以下２桁の値となる' do
                    amount10 = '1/2個'
                    gen_amount = amount10.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount).to_f).floor(2)
                    expect(quantity).to eq 0.50
                end
            end    
        end
    end
    
    #quantity_conversion_branch => quantity_conversion_chicken_breast
    context "food_hashが'鶏むね肉'または'鶏もも肉'の場合" do
        context "@amountに'枚'が含まれる場合" do
            context "@amountに”~”または”〜”が含まれる場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount11 = '１〜２枚'
                    gen_amount = amount11.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount.sub!(/~.*/m,"")).to_f*250.to_f).floor(2)
                    expect(quantity).to eq 250.00
                end
            end
            context "@amountに”~”または”〜”が含まれない場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount12 = '4枚'
                    gen_amount = amount12.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount).to_f*250.to_f).floor(2)
                    expect(quantity).to eq 1000.00
                end
            end
        end
        context "@amountに'g'または'グラム'が含まれる場合" do
            context "@amountに”~”または”〜”が含まれる場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount13 = "500~600g"
                    gen_amount = amount13.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount.sub!(/~.*/m,""))/criterion_value3.to_f).floor(2)
                    expect(quantity).to eq 500.00
                end
            end
            context "@amountに”~”または”〜”が含まれない場合" do
                it "quntityは小数点以下２桁の値となる" do
                    amount14 = "150g"
                    gen_amount = amount14.tr('〇一二三四五六七八九', '0123456789').tr('０-９ａ-ｚＡ-Ｚ／〜', '0-9a-zA-Z/~').delete("^0-9/~","^０-９／〜")
                    quantity = (Rational(gen_amount)/criterion_value3.to_f).floor(2)
                    expect(quantity).to eq 150.00
                end
            end
        end
    end
end
