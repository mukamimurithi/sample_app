class User < ApplicationRecord
validates :email, presence: true, length: { maximum: 255 },
format: { with: VALID_EMAIL_REGEX },
uniqueness: true
end
