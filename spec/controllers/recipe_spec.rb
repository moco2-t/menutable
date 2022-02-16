=begin
RSpec.describe '' do
    before do
        
    end
    context 'amountに"小さじ＋数字"が含まれる場合' do
        it 'quantityが計算されること' do
            quantity = Rational(@amount.tr('０-９ａ-ｚＡ-Ｚ／', '0-9a-zA-Z/').delete("^0-9/","^０-９／")).to_f*5
            expect(quantity).to eq 5.0
        end
    end
=end