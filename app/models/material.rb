class Material < ApplicationRecord
    validates :quantity, presence:{message: 'は必須項目です。半角数字で入力してください。'}
    
end
