class User < ApplicationRecord

    has_secure_password
    validate :presence
    with_options format:{ with:/\A[a-zA-Z0-9]+\z/} do
        validates :login_id
        validates :password
    end

    private

    def presence
        return if login_id.present?
            errors.add(:base, "IDを半角英数で入力してください.")
    end
    
end
