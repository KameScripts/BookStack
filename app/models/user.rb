class User < ApplicationRecord
  # これを加えるだけで、パスワードのハッシュ化やバリデーションが有効になります
  has_secure_password

  validates :email, presence: true, uniqueness: true
end
