
module Material 
    def food_material
        case @temporary_food_id
        when "220" then
            #220:パン粉
            conversion_1
        when "225"
            #225:カレールー
            conversion_2
        when "192","193","204" then
            #192:胡椒,193:塩胡椒,204:カレー粉
            conversion_3
        when "17","38","41","65","111","121","144","151","152","162" then 
            #144:米、151:中華麺、111:あじ、121:さんま、17:ゴボウ、38:トマト、41:パプリカ、65:じゃが芋、152:焼きそば麺、162:かまぼこ
            conversion_4
        when "189","201","202","215","216","218","219" then
            #215:片栗粉,216:薄力粉,189:砂糖,202:鶏ガラスープの素,201:和風だしの素,218:お好み焼き粉,219:ホットケーキミックス
            conversion_5
        when "190","203","211","217","221" then 
            #221:バター、211:マヨネーズ、217:ベーキングパウダー、203:コンソメ、190:グラニュー糖
            conversion_6
        when "160","169","172","184","185","186","187","188","197","198","199","200","205","206","212","222","223","224" then
            #160:豆乳,169:牛乳,172:生クリーム,186:料理酒,197:粒マスタード,187:本みりん,184:薄口醤油,198:白だし,185:濃口醤油,水,188:酢
            #206:レモン汁,199:めんつゆ,205:ポン酢,212:ナンプラー,200:だし汁,222:サラダ油,224:ごま油,223:オリーブオイル
            conversion_7
        when "191","194","208","209","210" then
            #194:味噌,191:塩,210:トマトケチャップ,209:オイスターソース,208:ウスターソース
            conversion_8
        when "195","196","207","213","214" then
            #195:豆板醤,207:中濃ソース,213:メープルシロップ,214:はちみつ,196:コチュジャン
            conversion_9
        when "73","142" then
            #73:唐辛子,142:海苔
            conversion2_1
        when "17" then
            #17:人参
            conversion2_2
        when "43","66" then
            #43:おくら、66:ニンニク
            conversion2_3
        when "39","52","55","168" then 
            #52:マッシュルーム、168:うずらの卵、39:ミニトマト、55:いんげん
            conversion2_4
        when "47" then
            #47:しいたけ
            conversion2_5
        when "30","68","70" then 
            #30:アスパラガス、68:しょうが、70:みょうが
            conversion15
        when "85","86","136","138","159","162" then 
            #136:かき、138:はまぐり、85:くり、86:いちご、159:油揚げ、162:ちくわ
            conversion16
        when "40","139" then 
            #139:ほたて貝、40:ピーマン
            conversion17
        when "51","178" then
            #51:エリンギ,178:納豆
            conversion18
        when "132" then
            #132:えび
            conversion19
        when "26","61" then
            #26:みつば、61:里芋
            conversion20
        when "82","146" then
            #146:餅、82:びわ
            conversion21
        when "104","105","155" then 
            #155:食パン、104:手羽元、105:手羽先
            conversion22
        when "167" then
            #167:卵
            conversion23
        when "16","37","78","124" then
            #124:ぶり、16:かぶ、37:なす、78:みかん
            conversion24
        when "25","28","29","36","45","49","50","53","91","112","113","114","116","117","118","119","120","122","161" then
            #25:ねぎ、28:にら、29:セロリ、36:きゅうり、45:にんにくの芽、49:えのき、50:しめじ、53:舞茸,91:キウイ,112:たら,113:いわし,114:かじきまぐろ,116:かれい,117:鯛,118:鮭,119:さば,120:さわら
            #122:すずき,161:はんぺん
            conversion25
        when "145","158" then
            #145:もち米,158:厚揚げ
            conversion26
        when "74","148","149" then 
            #148:うどん、149:そば、74:ゆず
            conversion27
        when "24","27","32","34","44","46","89" then 
            #24:ほうれん草、27:春菊、32:ブロッコリー、34:水菜、44:たまねぎ、89:ばなな、46:もやし
            conversion28
        when "64","81","83" then
            #64:さつまいも、81:柿、83:桃
            conversion29
        when "22","33","79","128" then
            #128:いか、22:小松菜、33:レタス、79:りんご
            conversion30
        when "42" then
            #42:とうもろこし
            conversion31
        when "62","63" then
            #62:ながいも、63:山芋
            conversion32
        when "31" then
            #31:カリフラワー
            conversion33
        when "15" then
            #15:大根
            conversion34
        when "23","54" then
            #23:キャベツ、54:かぼちゃ
            conversion35
        when "87" then
            #87:メロン
            conversion36
        when "21" then
            #21:白菜
            conversion37
        when "71","72" then
            #71:おろしにんにく,72:おろししょうが
            conversion39
        when "102","157","175" then
            #102:鶏もも肉,157:豆腐,175:こんにゃく
            conversion40
        when "103" then
            #103:鶏むね肉
            conversion41
        when "106" then
            #106:ささみ
            conversion42
        when "130" then
            #130:たこ
            conversion43
        when "140" then
            #140:昆布
            conversion44
        when "164" then
            #164:ハム
            conversion45
        when "165","166" then
            #165:ウインナー,166:ベーコン
            conversion46
        when "176" then
            #176:白滝
            conversion47
        when "226" then
            #226:白滝
            conversion48
        else
            conversion3_3
            #19:筍,20:蓮根
            #48:なめこ
            #56:えんどうまめ,57:グリンピース,58:そらまめ,59:えだ豆,60:小豆
            #67:わさび,69:しそ,75:パセリ,76:ローズマリー,77:バジル
            #84:ぶどう,88:スイカ,90:パイナップル
            #92:牛薄切り肉,93:牛バラ肉,94:牛ブロック肉,95:牛挽き肉,96:豚薄切り肉,97:豚バラ肉,98:豚こま肉,99:豚ロース肉,100:豚ブロック肉,101:豚挽き肉,107:鶏挽き肉,108:鴨肉,109:ラム肉,110:合い挽き肉
            #115:かつお,123:ひらめ,125:まぐろ,126:かんぱち,127:サーモン
            #129:かに（かに缶）,131:うに,133:あなご,134:うなぎ,135:あさり,137:しじみ
            #141:わかめ,143:青海苔
            #147:白米,150:そうめん153:パスタ,154:マカロニ,156:シリアル
            #170:チーズ,171:ヨーグルト,173:クリームチーズ
            #174:麩,177:かんぴょう,179:餃子の皮,180:春巻きの皮,181:春雨,182:かつお節,183:天かす
        end
        
    end

    #パン粉/g
    def conversion1
        if @amount.include?("大さじ")
            @quantity = @converted_number*3
        elsif @amount.include?("小さじ")
            @quantity = @converted_number*1
        elsif @amount.include?("g") or @amount.include?("mL") or @amount.include?("cc")
            @quantity = @converted_number              
        end
    end
    
    #カレールー/欠片
    def conversion2
        if @amount.include?("かけ") or @amount.include?("欠片")
            @quantity = @converted_number
        elsif @amount.include?("g")
            @quantity = @converted_number/20                
        elsif @amount.include?("箱")  
            @quantity = 8
        end        
    end
    
    #胡椒/g,塩胡椒/g,カレー粉
    def conversion3
        if @amount.include?("大さじ")
            @quantity = @converted_number*6
        elsif @amount.include?("小さじ")
            @quantity = @converted_number*2
        elsif @amount.include?("g") or @amount.include?("mL") or @amount.include?("cc")
            @quantity = @converted_number                
        end   
    end
    
    #ゴボウ/本、トマト/個、パプリカ/個、じゃがいも/個、あじ/尾、さんま/尾、米/合、中華麺/玉、焼きそば麺/玉、かまぼこ/個
    def conversion4
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/150
        elsif @amount.include?("合") or @amount.include?("玉") or @amount.include?("尾") or @amount.include?("本") or @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end 
    end
    
    #片栗粉/g,薄力粉/g,砂糖/g,鶏ガラスープの素/g,和風だしの素/g,お好み焼き粉/g,ホットケーキミックス/g
    def conversion5
        if @amount.include?("大さじ")
            @quantity = @converted_number*9
        elsif @amount.include?("小さじ")
            @quantity = @converted_number*3
        elsif @amount.include?("カップ")
            @quantity = @converted_number*100
        elsif @amount.include?("g") or @amount.include?("mL") or @amount.include?("cc")
            @quantity = @converted_number
        end
    end
    
    #バター/g、マヨネーズ/g、ベーキングパウダー/g、コンソメ/g、グラニュー糖/g
    def conversion6 
        if @amount.include?("大さじ")
            @quantity = @converted_number*12
        elsif @amount.include?("小さじ")
            @quantity = @converted_number*4
        elsif @amount.include?("g") or @amount.include?("mL") or @amount.include?("cc")
            @quantity = @converted_number                
        end
    end
    
    #牛乳/mL、豆乳/mL,生クリーム/mL,薄口醤油/mL,濃口醤油/mL,料理酒/mL,本みりん/mL,酢/mL,粒マスタード/g,白だし/mL,めんつゆ/mL
    #だし汁/mL,ポン酢/mL,レモン汁/mL,ナンプラー/mL,サラダ油/mL,ごま油/mL,オリーブオイル/mL
    def conversion7
        if @amount.include?("大さじ")
            @quantity = @converted_number*15
        elsif @amount.include?("小さじ")
            @quantity = @converted_number*5
        elsif @amount.include?("g") or @amount.include?("mL") or @amount.include?("cc")
            @quantity = @converted_number              
        elsif @amount.include?("カップ")
            @quantity = @converted_number*200
    end
    
    #味噌/g,塩/g,トマトケチャップ/g,オイスターソース/g,ウスターソース/g
    def conversion8
        if @amount.include?("大さじ")
            @quantity = @converted_number*18
        elsif @amount.include?("小さじ")
            @quantity = @converted_number*6
        elsif @amount.include?("g") or @amount.include?("mL") or @amount.include?("cc")
            @quantity = @converted_number              
        end
    end
    
    #豆板醤/g,中濃ソース/g,メープルシロップ/mL,はちみつ/g,コチュジャン/g
    def conversion9
        if @amount.include?("大さじ")
            @quantity = @converted_number*21
        elsif @amount.include?("小さじ")
            @quantity = @converted_number*7
        elsif @amount.include?("g") or @amount.include?("mL") or @amount.include?("cc")
            @quantity = @converted_number              
        end
    end
    
    #唐辛子/本,海苔/枚
    def conversion10
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/2
        elsif @amount.include?("本") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #人参/個
    def conversion11
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/170
        elsif @amount.include?("本") or @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #おくら/個、にんにく/片
    def conversion12
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/8
        elsif @amount.include?("個") or @amount.include?("片")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #マッシュルーム/個、うずらの卵/個、ミニトマト/個、いんげん/本
    def conversion13
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/10
        elsif @amount.include?("個") or @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #しいたけ/個
    def conversion14
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/15
        elsif @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #アスパラガス/本、しょうが/欠片、みょうが/本
    def conversion15
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/20
        elsif @amount.include?("本") or @amount.include?("欠片")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end 
    end
    
    #かき/個、はまぐり/個、くり/個、いちご/個、油揚げ/枚、ちくわ/本
    def conversion16
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/30
        elsif @amount.include?("個") or @amount.include?("枚") or @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #ほたて貝/個、ピーマン/個
    def conversion17
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/35
        elsif @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #エリンギ/本、納豆/パック
    def conversion18
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/40
        elsif @amount.include?("パック")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end         
    end
    
    #えび/尾
    def conversion19
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/45
        elsif @amount.include?("尾")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
        
    #みつば/束、里芋/個
    def conversion20
        if @amount.include?("g") 
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/50
        elsif @amount.include?("束") or @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #餅/枚、びわ/個
    def conversion21
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/55
        elsif @amount.include?("個") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #食パン/枚、手羽元/本、手羽先
    def conversion22
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/60
        elsif @amount.include?("本") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #卵/個
    def conversion23
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/70
        elsif @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #かぶ/個、なす/個、みかん/個、ぶり/切
    def conversion24
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/80
        elsif @amount.include?("個") or @amount.include?("切")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #たら、イワシ、カジキマグロ、かれい、鯛、鮭、さば、サワラ、すずき、ねぎ/本、にら/束、セロリ/本、きゅうり/本、えのき、しめじ、舞茸、にんにくの芽/束、キウイ、たらこ
    #ねぎ/本、にら/束、セロリ/本、きゅうり/本、にんにくの芽/束、えのき/袋、しめじ/袋、舞茸/袋、キウイ/個、たら/切、いわし/尾、かじきまぐろ/切、かれい/切、鯛/切、鮭/切、さば/切、さわら/切、すずき/切、はんぺん/個
    def conversion25
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/100
        elsif @amount.include?("本") or @amount.include?("束") or @amount.include?("袋") or @amount.include?("個") or @amount.include?("切") or @amount.include?("尾") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #もち米/合,厚揚げ/枚
    def conversion26
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/155
        elsif @amount.include?("合") or @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end        
    end
    
    #うどん/玉、そば/玉、ゆず/個
    def conversion27
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/180
        elsif @amount.include?("個") or @amount.include?("玉")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end 
    end
    
    #ほうれん草/束、春菊/束、ブロッコリー/株、水菜/束、たまねぎ/個、ばなな/本、もやし/袋
    def conversion28
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/200
        elsif @amount.include?("束") or @amount.include?("株") or @amount.include?("個") or @amount.include?("袋") or @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #さつまいも/本、柿/個、桃/個
    def conversion29
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/250
        elsif @amount.include?("本") or @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #小松菜/束、レタス/玉、りんご/個、いか/杯
    def conversion30
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/300
        elsif @amount.include?("束") or @amount.include?("玉") or @amount.include?("個") or @amount.include?("杯")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #とうもろこし/本、なし
    def conversion31
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/350
        elsif @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #ながいも/本、山芋/本
    def conversion32
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/400
        elsif @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #カリフラワー/株
    def conversion33
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/500
        elsif @amount.include?("株")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #大根/本
    def conversion34
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/1000
        elsif @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #キャベツ/個、かぼちゃ/個
    def conversion35
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/1200
        elsif @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #メロン/個
    def conversion36
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/1500
        elsif @amount.include?("個")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #白菜/本
    def conversion37
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/2000
        elsif @amount.include?("本")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #筍/g,蓮根/g,パセリ/g,なめこ/g,
    #えんどうまめ/g,グリンピース/g,そらまめ/g,えだ豆/g,小豆/g
    #わさび/g,しそ/枚,ローズマリー/g,バジル/g
    #ぶどう/個,スイカ/g,パイナップル/g
    #牛薄切り肉,牛バラ肉,牛ブロック肉,牛挽き肉,豚薄切り肉,豚バラ肉,豚こま肉,豚ロース肉,豚ブロック肉,豚挽き肉,鶏むね肉,ささみ,鶏挽き肉,鴨肉,ラム肉,合い挽き肉
    #かつお/g,ひらめ/g,まぐろ/g,かんぱち/g,サーモン/g
    #かに/g,うに/g,あなご/g,うなぎ/g,あさり/g,しじみ/g
    #わかめ/g,青海苔/g
    #白米/g,そうめん/g,パスタ/g,マカロニ/g,シリアル/g
    #チーズ/g,ヨーグルト/g,クリームチーズ/g
    #麩/g,かんぴょう/g,餃子の皮/枚,春巻きの皮/枚,春雨/g,かつお節/g,天かす/g
    def conversion3_3
        if @amount.include?("g")
            @quantity = @converted_number 
        else
            @quantity = @converted_number
        end           
    end
    
    #おろしにんにく/g,おろししょうが/g
    def conversion39
        if @amount.include?("大さじ")
            @quantity = @converted_number*3
        elsif @amount.include?("小さじ")
            @quantity = @converted_number*1
        elsif @amount.include?("cm")
            @quantity = @converted_number*0.5
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #鶏もも肉/g、豆腐/g、こんにゃく/g
    def conversion40
        if @amount.include?("枚") or @amount.include?("丁") or @amount.include?("袋")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*250
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #鶏むね肉/g
    def conversion41
        if @amount.include?("枚")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*180
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #ささみ/g
    def conversion42
        if @amount.include?("本")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*40
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #たこ/g
    def conversion43
        if @amount.include?("本")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*80
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #昆布/枚
    def conversion44
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/4
        elsif @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #ハム/g
    def conversion45
        if @amount.include?("枚")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*10
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #ウインナー/g,ベーコン/g
    def conversion46
        if @amount.include?("枚") or @amount.include?("本")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*20
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #白滝/g
    def conversion47
        if @amount.include?("袋")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f*200
        elsif @amount.include?("g")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
    
    #厚切り豚ロース肉/g
    def conversion48
        if @amount.include?("g")
            @quantity = @amount.tr('０-９ａ-ｚＡ-Ｚ ', '0-9a-zA-Z ').delete("^0-9/","^０-９／").to_f/130
        elsif @amount.include?("枚")
            @quantity = @converted_number
        else
            @quantity = @converted_number
        end
    end
end
end