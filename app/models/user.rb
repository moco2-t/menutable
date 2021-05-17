class User < ApplicationRecord
validates :login_id,{uniqueness:true} #重複がないか
validates :login_id,{presence: true} #空欄でないか
validates :password,{presence: true} #空欄でないか
has_secure_password

end
