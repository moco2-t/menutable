class Recipe < ApplicationRecord
    validates :name, presence: { message: 'は1文字以上入力してください。' }
    validates :keyword ,format:{with:/\A[ぁ-んァ-ン一-龥]/, message: 'は全角ひらがな、全角カタカナ、漢字で入力してください'}
    validates :address ,presence:{ message: 'は必須項目です。入力して下さい。' }
end
