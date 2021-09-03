module Conversion
    #15:大根/本
    def conversion1
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/1000
        elsif @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = 0.5
        end
    end

    #16:かぶ/個、37:なす/個、78:みかん/個、124:ぶり/切
    def conversion2
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/80
        elsif @amount.include?("個") or @amount.include?("切")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #17:人参/個
    def conversion3
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/170
        elsif @amount.include?("本") or @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #18:ゴボウ/本、38:トマト/個、41:パプリカ/個、65:じゃが芋/個、111:あじ/尾、121:さんま/尾
    #144:米/合、151:中華麺/玉、152:焼きそば麺/玉、162:かまぼこ/個
    def conversion4
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/150
        elsif @amount.include?("合") or @amount.include?("玉") or @amount.include?("尾") or @amount.include?("本") or @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end 
    end

    #21:白菜/本
    def conversion5
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/2000
        elsif @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = 0.25 #1/4
        end
    end

    #22:小松菜/束、33:レタス/玉、79:りんご/個、128:いか/杯
    def conversion6
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/300
        elsif @amount.include?("束") or @amount.include?("玉") or @amount.include?("個") or @amount.include?("杯")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #23:キャベツ/個、54:かぼちゃ/個
    def conversion7
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/1200
        elsif @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = 0.5 #1/2
        end
    end

    #24:ほうれん草/束、27:春菊/束、32:ブロッコリー/株、34:水菜/束、44:たまねぎ/個、46:ばなな/本、89:もやし/袋
    def conversion8
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/200
        elsif @amount.include?("束") or @amount.include?("株") or @amount.include?("個") or @amount.include?("袋") or @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #25:ねぎ/本、28:にら/束、29:セロリ/本、36:きゅうり/本、45:にんにくの芽/束、49:えのき/袋、50:しめじ/袋、53:舞茸/袋、
    #91:キウイ/個、112:たら/切、113:いわし/尾、114:かじきまぐろ/切、116:かれい/切、117:鯛/切、118:鮭/切、119:さば/切、
    #120:さわら/切、122:すずき/切、161:はんぺん/個
    def conversion9
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/100
        elsif @amount.include?("本") or @amount.include?("束") or @amount.include?("袋") or @amount.include?("個") or @amount.include?("切") or @amount.include?("尾") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #26:みつば/束、61:里芋/個
    def conversion10
        if @amount.include?("g") 
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/50
        elsif @amount.include?("束") or @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #30:アスパラガス/本、68:しょうが/欠片、70:みょうが/本
    def conversion11
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/20
        elsif @amount.include?("本") or @amount.include?("欠片")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end 
    end

    #31:カリフラワー/株
    def conversion12
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/500
        elsif @amount.include?("株")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #39:ミニトマト/個、52:マッシュルーム/個、55:いんげん/本、168:うずらの卵/個
    def conversion13
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/10
        elsif @amount.include?("個") or @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #40:ピーマン/個、139:ホタテ貝/個
    def conversion14
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/35
        elsif @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #42:とうもろこし/本
    def conversion15
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/350
        elsif @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #43:おくら/個、66:にんにく/片
    def conversion16
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/8
        elsif @amount.include?("個") or @amount.include?("片")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #47:しいたけ/個
    def conversion17
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/15
        elsif @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #51:エリンギ/本、178:納豆/パック
    def conversion18
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/40
        elsif @amount.include?("パック")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end         
    end

    #62:ながいも/本、63:山芋/本
    def conversion19
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/400
        elsif @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #64:さつまいも/本、81:柿/個、83:桃/個
    def conversion20
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/250
        elsif @amount.include?("本") or @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #71:おろしにんにく/g,72:おろししょうが/g
    def conversion21
        if @amount.include?("大さじ")
            @quantity = @converted_number*3
        elsif @amount.include?("小さじ")
            @quantity = @converted_number*1
        elsif @amount.include?("cm")
            @quantity = @converted_number*0.5
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #73:唐辛子/本,142:海苔/枚
    def conversion22
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/2
        elsif @amount.include?("本") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end
    
    #74:ゆず/個、148:うどん/玉、149:そば/玉
    def conversion23
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/180
        elsif @amount.include?("個") or @amount.include?("玉")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end 
    end

    #82:びわ/個、146:餅/枚
    def conversion24
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/55
        elsif @amount.include?("個") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #85:くり/個、86:いちご/個、136:かき/個、138:はまぐり/個、159:油揚げ/枚、162:ちくわ/本
    def conversion25
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/30
        elsif @amount.include?("個") or @amount.include?("枚") or @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #102:鶏もも肉/g、157:豆腐/g、175:こんにゃく/g
    def conversion26
        if @amount.include?("枚") or @amount.include?("丁") or @amount.include?("袋")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*250
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = 100
        end
    end

    #103:鶏むね肉/g
    def conversion27
        if @amount.include?("枚")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*180
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = 100
        end
    end

    #104:手羽元/本、105:手羽先/本、155:食パン/枚
    def conversion28
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/60
        elsif @amount.include?("本") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = 6
        end
    end
    
    #106:ささみ/g
    def conversion29
        if @amount.include?("本")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*40
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = 100
        end
    end
    
    #130:たこ/g
    def conversion30
        if @amount.include?("本")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*80
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = 100
        end
    end
    
    #132:えび/尾
    def conversion31
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/45
        elsif @amount.include?("尾")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end
    end

    #145:もち米/合,158:厚揚げ/枚
    def conversion32
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/155
        elsif @amount.include?("合") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = 1.0
        end        
    end

    #164:ハム/g
    def conversion33
        if @amount.include?("枚")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*10
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = 100
        end
    end

    #165:ウインナー/g,166:ベーコン/g
    def conversion34
        if @amount.include?("枚") or @amount.include?("本")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*20
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = 100
        end
    end

    #167:卵/個
    def conversion35
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/70
        elsif @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = 6
        end
    end

    #176:白滝/g
    def conversion36
        if @amount.include?("袋")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*200
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = 200
        end
    end

    #140:昆布,160:海苔,169:牛乳,172:生クリーム,184:薄口醤油~225:カレールー
    def conversion37
        @quantity = nil
    end
    
    #19:筍,20:蓮根
    #48:なめこ
    #56:えんどうまめ,57:グリンピース,58:そらまめ,59:えだ豆,60:小豆
    #67:わさび,69:しそ,75:パセリ,76:ローズマリー,77:バジル
    #80:なし,84:ぶどう,87:メロン,88:スイカ,90:パイナップル
    #92:牛薄切り肉,93:牛バラ肉,94:牛ブロック肉,95:牛挽き肉,96:豚薄切り肉,97:豚バラ肉,98:豚こま肉,99:豚ロース肉,100:豚ブロック肉,101:豚挽き肉,107:鶏挽き肉,108:鴨肉,109:ラム肉,110:合い挽き肉
    #115:かつお,123:ひらめ,125:まぐろ,126:かんぱち,127:サーモン
    #129:かに（かに缶）,131:うに,133:あなご,134:うなぎ,135:あさり,137:しじみ
    #141:わかめ,143:青海苔
    #147:白米,150:そうめん153:パスタ,154:マカロニ,156:シリアル
    #170:チーズ,171:ヨーグルト,173:クリームチーズ
    #174:麩,177:かんぴょう,179:餃子の皮,180:春巻きの皮,181:春雨,182:かつお節,183:天かす
    def conversion38
        if @amount.include?("g")
            @quantity = @converted_number 
        else
            @quantity = @converted_number
        end           
    end

end
